#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlContext>
#include <QColor>
#include "core.h"
#if defined(Q_OS_WIN)
#include <QtWin>
#endif

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //Application information
    QCoreApplication::setApplicationName("TemplateQtQuick");
    QCoreApplication::setOrganizationName("3dproger");
    QCoreApplication::setOrganizationDomain("https://github.com/3dproger");
    QCoreApplication::setApplicationVersion("1.0");

    //Translations
    QLocale().setDefault(QLocale::system().name());
    QString languageTag = QLocale().bcp47Name().toUtf8();

    QTranslator appTranslator;
    if (languageTag.toLower() == "c" || languageTag.toLower() == "en"){
        qApp->removeTranslator(&appTranslator);
    }
    else{
        QString i18nFileName = ":/app_" + languageTag + ".qm";

        if (appTranslator.load(i18nFileName)){
            qApp->installTranslator(&appTranslator);
        }
        else{
            qDebug(QString("Can't find application translation: \"%1\"").arg(languageTag).toUtf8());
        }

    }

    qmlRegisterUncreatableType<Core> ("Core.Core", 1, 0, "Core", "Не предназначен для создания в QML коде");

    //Windows color
    #if defined(Q_OS_WIN)
    QColor backgroundColor = QtWin::realColorizationColor();
    backgroundColor.setAlpha(255);
    QColor colorizationColor = QColor(255 - backgroundColor.red(), 255 - backgroundColor.green(), 255 - backgroundColor.blue());
    colorizationColor.setAlpha(255);
    #elif
    QColor backgroundColor = QColor("#000000");
    QColor colorizationColor = QColor("#FFFFFF");
    #endif

    //QML
    QQmlApplicationEngine engine;

    //
    engine.rootContext()->setContextProperty("QT_VERSION", QString(qVersion()));
    engine.rootContext()->setContextProperty("BUILD_CPU_ARCH", QString(QSysInfo::buildCpuArchitecture()));
    engine.rootContext()->setContextProperty("BUILD_DATE", QString("%1 %2").arg(__DATE__).arg(__TIME__));

    Core core;
    engine.rootContext()->setContextProperty("core", &core);

    engine.rootContext()->setContextProperty("backgroundColor", backgroundColor);
    engine.rootContext()->setContextProperty("colorizationColor", colorizationColor);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

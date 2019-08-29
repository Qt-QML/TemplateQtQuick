# TemplateAppQtQucik
Шаблон для построения приложения на Qt Quick</br>
Реализовано:
- Главное окно с некоторыми элемениами
- Реализован C++ класс "Core", который предназначен для последующей реализации Backend-части приложения. Экземпляр доступен из QML-кода
- Вывод информации о сборке приложения (Версия Qt, архитектура CPU и др.)
- Интернационализация - подготовлены ts-файл и загрузка qm-файла при запуске
- Настройки стиля в файле qtquickcontrols2.conf
- Подключён qrc-файл ресурсов
- Для Windows: сборка exe и необходимых зависимостей в путь: {директория проекта}\deploy\{платформа} в режиме выпуска
- Для Windows: реализована иконка исполнительного файла (Icon made by Freepik from www.flaticon.com)
- Подключён C++ класс "Utils" с собственными статическими функциями, которые часто использую в своих проектах

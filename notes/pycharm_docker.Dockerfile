flask console пашет если имя модуля app, или установлена FLASK_APP=app в pycharm или dockerfile

нужно в debug configuration запускать сервер разработки на 0.0.0.0(flask run -h 0.0.0.0) чтобы можно было пинать с хоста
для dockerfile нужно указать опции проброса портов в flask run configuration

run configuration сам запустит нужные контейнеры, до этого они должны быть compose down

при дебаге сервисы красные при наведении на services - мб compose.override file from which this service was created does not exist -> вроде пофиг и так пашет

module not found в консоли - проблема с пробросом working dir(а для дебаг консоли она своя) в python path
в скрипт консоли, прибить консоль
    sys.path.append([WORKING_DIR_AND_PYTHON_PATHS][0] + '/app')
    или
    env
        FLASK_APP=/app/identidock.py;

    locals().update(ScriptInfo(
        os.getenv('FLASK_APP')
    ).load_app().make_shell_context())
    # на данный момент pycharm не умеет расширять environ через интерфейс - например PATH=".$PATH" -> будет интерпретировано как литерал


WORKING_DIR_AND_PYTHON_PATHS
# захардкоженный в java литерал
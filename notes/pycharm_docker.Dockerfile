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

attach to process
# не пашет с докером
    проверить
    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

открыть порт в докере
pydevd --port 10000 --client 0.0.0.0 --file echo.py

# то что он делает
python -u /opt/.pycharm_helpers/pydev/pydevd.py --module --multiprocess --qt-support=auto --port 54433 --file flask run --port 9000


как по факту
    не забыть поднимать сервер на нужном порту и 0.0.0.0(чтобы был доступен с хоста)
    указать порт в конфиге дебага или композе

нуждается в доработке
извращение - заменить uwsgi написанный не на python и который не мб отлажен(?) gdb - на встроенный wsgiref.simple_server
    run/debug configuration
        python script

    в результате будет выполнен(-m добавленный в конце игнорится!)
        * module name: app
        * пробросить нужный порт докера
        * interpreter options(будет передан в python)
            -c "from wsgiref.simple_server import *;from app import app;s=WSGIServer(('0.0.0.0', 9000), WSGIRequestHandler);s.set_app(app);s.serve_forever();"
            # ничего не выведет ибо не должно
        * working directory: расположение app
        результат выполнит
            python -c "from wsgiref.simple_server import *;from app import app;s=WSGIServer(('0.0.0.0', 9000), WSGIRequestHandler);s.set_app(app);s.serve_forever();" -u /opt/.pycharm_helpers/pydev/pydevd.py --module --multiprocess --qt-support=auto --port 51012 --file app
            т.е. serve_forever залочит запуск отладчика - почти дедлок

inspect
    -f {{.Author}} image

ps -l возвращает последний контейнер в любом состоянии

system
    df
    # disk usage
    reclaimable - % доступный для удаления sytem prune -a | volume prune -a, ресурсы не используемые запущенными контейнерами и untagged images

logs
# вроде просто выводит то что было записано в stdout|stderr

run
    -a
    # подключить к терминалу стандартные потоки stdout & stderr by def
        -ai
        # подключает еще и stdin
    #несовместим с -d
    перенаправление вывода
        docker run -a STDERR debian /bin/bash -c "echo hi>&2"

    -d
    # отключение от всех потоков и запуск в фоне, возвращает id
    # несовместим c a

    -i
    # поддерживает доступность открытого потока stdin(даже if он не был подключен
        docker run python python3 -c "input()"
        >> err eof

    -t
    # создает псевдо устройство терминала
        docker run -t=false debian ...
        docker exec -it /bin/bash # сработает т.к. создает новый tty
    # возм он не нужен когда контейнер должен читать stdin, но с ним не нужно работать через терминал(т.е. не нужна доп обработка)

    --restart
    # restart policy
        no
        # запрет ребута
        always
        # перезапускать при любом статусе выхода
        on-failure[:n]
        # перезапуск при !0 статусе выхода
        # n - max число попытак
    # при рестарте показывает статус выхода в ps

    # conflicts
        --rm
    --env-file
    # передача env через файл
        docker run -e hi=1 debian bash echo $hi
        # берет из хоста

        docker run -e hi=1 debian echo \$hi
        # эскепит $ - hi литерал

        docker run -e hi=1 debian bash -c "echo \$hi"
        # литерал, но резолвится т.к. предается в новый шелл
        >> 1

    --entrypoint
    # replace ENTRYPOINT

    --user
    # replace USER

    --workdir
    # replace WORKDIR

attach
# attach to main process in cont

docker cp
# копирование между контейнером и хостом
путь в конт абсолютный, но первый / мб опущен
    /tmp/file ~ tmp/file
путь хоста относительный | абс
# owner в контейнере - юзер в контейнере
# при копировании на хост - owner тот кто вызвал cp
    -a
    # сохранять пользователя при переносе
# не создает не сущ родительские директории
    docker cp new_file.txt cp:/usr  # скопирует в usr
    docker cp new_file.txt cp:/is_not_dir  # скопирует как /is_not_dir
    docker cp new_file.txt cp:/new_dir/  # err
--follow-link
    # вместо ссылок - копирует сами файлы


exec
# по сути аналог ssh - подключится к контейнеру минуя основной процесс запущенный в нем
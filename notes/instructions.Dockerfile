ADD
# копирует файлы из контекста или url
# локальные архивы автоматом распаковыываются, bz2 и tar.gz, с zip уже копируется сам архив
# из-за сложности - может быть лучше юзать run curl | wget для url & copy для копирования

CMD
# запуск инструкции при инициализации контейнера
# if определена entrypoint - заданная в cmd инструкция будет интерпретирована как аргумент entrypoint?(в этом случае необходимо использовать формат exec)
# замещается любыми аргументами переданными в docker run
# выполняется только последняя cmd(включая базовые образы) - остальные отменяются

COPY
# умеет glob
# не умеет выходить из контекста например ../outer
COPY ["source", "target"]
COPY source, target

ENTRYPOINT
# запускает команду и цепляется к io
# сжирает любые аргументы предыдущей CMD | docker run после образа
# часто используется для организации скриптов запуска инициализирующей vars & сервисы, перед обработкой переданных в образ аргументов
# при этом если она определена - в нее передаются как аргументы содержимое последней cmd или агрументов run, притом с явным /bin/sh


ENV
# json формат игнорится
ENV A 1
ENV B=2

EXPOSE
# уведомляет механизм docker что в контейнере будет слушаться этот порт, который использует это при соединения между контейнерами или при открытии общего доступа к портом docker run -P
# сама по себе не оказывает никакого воздействия на сетевую среду

FROM
всегда должна быть первой

MAINTAINER
# имя, контакты

ONBUILD
# определяет инструкцию которая должан выполняться при использовании во from
# мб полезно при обработке данных добавляемых в потомок

USER
# задает пользователя по имени|uid:group для последующих инструкций
# uid копируются с хоста, но имена могут присваиваться различных uid, что может приводить к затруднениям при установке прав достпа
# user uid вроде как создает пользователя, для задания имени можно юзать run useradd, затем можно залогиниться им передав в docker run -u нужного юзера(существующего в контейнере)

VOLUME
# объявляет файл/каталог как том(симлинки? сокеты?), if он сущ в образе - он (?откуда) копируется в том при запуске контейнера
# несколько args -> неск томов
# из соображений безопасности и переносимости - нельзя определить каталог хоста как том в Dockerfile
#if файл уже сущ в образе - err
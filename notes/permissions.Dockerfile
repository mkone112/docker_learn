ядро использует uid,gid для идентификации и авторизации, преобразование в символьные id exe в userspace -> id в контейнере == хосту, но пользователи и группы созданные в контейнере не передаются на хост -> ресурс тома может принадлежать одному пользователю в контейнере и другому на хосте

тк uid в хосте == конт -> после взлома контейнера - злоумышенник получит доступ к хосту имея права пользователя с uid == контейнерному, if это root - боль(может стоит давать uid вне диапазона хоста?)

на момент d 1.8 велась разработка механизма преобразования root uid в больший на хосте

permissions denied на volumes
    либо chown -r при создании юзера

    либо

    docker build --build-arg UID=$(id -u),GID=$(id -g) --no-cache -t perm .
    docker run --mount "type=bind,src=$(pwd)/,dst=/app"

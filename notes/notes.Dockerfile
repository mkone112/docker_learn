ругается на apt что не имеет стабильного cli интерфейса -> юзать apt-get

аргумент entry point можно указывать не в массиве
ENTRYPOINT /usr/games/cowsay "hello"

entrypoint жрет аргументы передаваемые в run

регистронезависим

build context
 #при передаче из stdin считается пустым
    docker build - < Dockerfile
    docker build - < context.tar.gz
 # передается в демон как tar архив?!
 # можно исп tar.gz | bzip2
 можно указать Dockerfile внутри контекста
    docker build -f dockerfiles/Dockerfile.debug

можно сделать build исп прямую ссылку начинающуюся с http|https на dockerfile -> контекст пуст
можно использовать ссылку на github.com|git@|git:// тогда контекстом будет содержимое репы
# клиент докера создаст клон и всех подчиненных модулей
    # лучше так не делать а перечислять репозитории вручную

не использовать
  upgrage
  инструменты управления конфигурацией
    puppet
    ansible
    salt
    chef
  непроверенные базовые образы
  секреты
  верифицируй загружаемые штуки sha
  минимум от рута
  expose только нужных портов
  старайся писать логи в stdout stderr чтобы это мог обрабатывать докер
  один контейнер на один сервис

ubuntu ~ library/ubuntu
# library походу псевдоним пространства имен root

вроде для контейнеров с -i или -t возможно detach по ctrl-q, ctrl-p, но у меня сработало ctrl-c
~ attach с --sig-proxy=false или установке detach-keys

вроде dockerfile не позволяет задавать точку монтирования для переносимости - не факт что нужная точка есть на другом хосте

cgroups
# механизм отвечаюий за управление ресурсами контейнеров цп, mem, ..., freezing(pause), unfreezing(unpause)

namespaces
# механизм изоляции контейнеров(фс, имя хоста, юзеры, сеть и процессы изолированы)

docker engine общается с компонентами по прикладным интерфейсам и их можно лего заменять(swarm, compose)

swarm
# работа с пачкой докер хостов как с единым ресурсом

machine
# устанавливает и конфигурирует docker-хосты на локальных и удаленных ресурсах
# конфигурирует клиент docker упрощая переключение между средами

trusted registry
# proprietary self-hosted docker-hub
    role-based access control(RBAC)

Weave
#third-party создание распределенной сети контейнеров
Project Calico
#third-party создание распределенной сети контейнеров

Consul
Registrator
SkyDNS
# резолв адресов контейнеров

Kubernates
# google third-party оркестрация

Marathon
# third-party оркестрация

Mesos
# third-party оркестрация

Fleet
# third-party оркестрация от coreos

на момент написания книги gitignore не умел исключить
test и /dir/test в одном выражении(тут только генерация dockerignore

каждая инструкция создает образ вспомогательного слоя который удаляется если не был передан --rm=false, результатом выполнения кажд иструкции явл статический образ(фс + метаданные), после этого при выполнении следующей инструкции или при запуске контейнера. И хотя в run можно запустить долговременные процессы - они будут завершены, поэтому это баг а не фича, любые сервисы которые нужно запускать при старте контейнера нужно указывать в cmd или entrypoint
# мне не удалось запустить паразитные процессы при остановленном контейнере

вроде криво сбилженному контейнеру присваивается id последнего удачно собранного слоя, а может они равны

если прибить контейнер на очередной run - он соберется, но предыдущие run вроде не закомитятся
...
RUN apt install python3
RUN python3 -c "while 1:..."
...
docker stop ...
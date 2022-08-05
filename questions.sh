docker ps filter ?
docker inspect --format ?

docker attach --detach-keys ?

--init ?

почему при реконекте - в контейнере нет интернета?

в образах почему-то встречаются cmd ["bash"] - может это проверка?
# походу чтобы ломать кеширование

не понял как работать с user - кроме mk ничего не смог передать, не обнаружил postgres в /etc/passwd, хотя он там как-бы есть, через u тоже не прокатило, походу при передаче имени - он должен уже сущетвовать

порядок run и volume не до конца понял

что будет если запредить icc и сделать link -> он внесет правки в iptables, т.е. iptables=false icc=false должны приводить к полной изоляции(не удалось завести с --iptables=false)
#как поменять параметры запуска dockerd? -> /lib/systemd/system/docker.service

интеграция с pycharm
  запуск команд
    docker console?
  подцепиться к процессу?
  плагины?

run --name <name>  remove_if_exist? -> только создавать alias

docker rm --link?
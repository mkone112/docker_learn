

additional property is not allowed - старый формат compose
в /lib/systemd/system/docker.service
заменить ExecStart ... -H -fd://
-H unix:///var/run/docker.sock
sudo service docker stop
sudo rm -rf /var/lib/docker
или
sudo rm /var/lib/docker/network/files/local-kv.db

sudo service docker start

    docker.socket: Failed with result 'service-start-limit-hit'.
    systemctl reset-failed docker.service
    systemctl status docker  >> docker.service: Start request repeated too quickly.

    gpg ... cant connect ipc agent
    # нужен инет побыстрей

>> reboot

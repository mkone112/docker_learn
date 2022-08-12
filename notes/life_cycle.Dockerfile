docker commit возвращает image id
    docker run -it $(docker commit <container>) /bin/bash
# switch case нечитаем, ужасный синтаксис
#

ARG UID
ARG GID

RUN \
    if [ ! "$UID" ]; then\
      ERR="UID host user need passed by --build-arg UID=\$(id -u)";\
    fi;\
    if [ ! "$GID" ]; then\
      ERR="${ERR}\nGID host user need passed by --build-arg GID=\$(id -g)";\
    fi; \
    RED='\033[0;31m';COLOR_END='\033[0m';\
    if [ "$ERR" ]; then echo "${RED}${ERR}${COLOR_END}" && exit 1; fi;
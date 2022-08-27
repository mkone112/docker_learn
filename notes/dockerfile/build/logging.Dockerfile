ENV  RED='\033[0;31m' COLOR_END='\033[0m'

# выводит текст, прокидывает env, текст красный
RUN echo "$RED FUCK${COLOR_END}" && exit 1

# кстати exec mode не особо то нужен для логгирования

# выводит текст прокидыает env, но не интерпретирует цвет
RUN ["/bin/bash", "-c", "echo ${RED}HI${COLOR_END}"]

# пашет
RUN ["/bin/sh", "-c", "echo ${RED}HI${COLOR_END}"]

# работает, но не очевидно, несколько проверок не доступны
RUN : ${UI:?FUCK}
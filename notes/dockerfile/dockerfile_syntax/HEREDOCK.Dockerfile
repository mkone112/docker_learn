here doc(ument)
БЕЗ ИНЕТА - УБИВАЕТ всю затею
#требует DOCKER_BUILDKIT=1 или buildx
# syntax=docker/dockerfile:1.3-labs
# или
# syntax=docker/dockerfile-upstream:1-labs
FROM python:3.10

# минус удаляет табы в начале(не пробелы)
RUN <<-EOL
    if [ ! "$GID" ]; then
      echo "\n${RED}GID host user need passed by --build-arg GID=\$(id -g)${COLOR_END}\n"; ERR=true
    fi
    if [ ! "$UID" ]; then
      echo "\n${RED}UID host user need passed by --build-arg UID=\$(id -u)${COLOR_END}\n"; ERR=true
    fi
    if [ $ERR ]; then exit 1; fi
EOL

RUN <<EOF | sh
echo aa
EOF

# отключает интерполяцию переменных
RUN <<'EOF'
EOF

# может передавать в потоки и использовать pipes
RUN <<EOF | sed ... > file.txt
EOF

# так вроде тоже пашет
RUN <<EOF >> file.txt
EOF

или даже так
COPY <<EOF /result.txt
alice
EOF

# копирование в два файла
COPY <<robots.txt <<humans.txt /usr/share/nginx/html/
(robots content)
robots.txt
(humans content)
humans.txt

# strip tabs
COPY <<-EOF /file.txt
	echo hello
EOF
RUN cat /file.txt
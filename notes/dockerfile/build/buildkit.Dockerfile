включается передачей в ТОЙ-ЖЕ КОМАНДЕ
DOCKER_BUILDKIT=1 docker build ...

# так не заработает
DOCKER_BUILDKIT=1
docker build ...

BUILDKIT_PROGRESS=plain

на данный момент кастомные фронтенды не кешируются - нужна сеть для сборки

чтобы видеть вывод команд нужно --progress=plain
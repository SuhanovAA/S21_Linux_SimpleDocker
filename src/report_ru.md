# Part 1. Готовый докер  
- `apt install docker.io`  
## Возьми официальный докер-образ с nginx и выкачай его при помощи docker pull.  
- `docker pull nginx`  
![docker_pull_nginx](./images/part1/01.png)  
`Образ скачан и собран на нашем сервере.`  
## Проверь наличие докер-образа через docker images.  
- `docker images`  
![docker_images](./images/part1/02.png)  
`Для проверки образов, которые уже установлены и имеются на нашем сервере, используется команда: docker images`  
    - REPOSITORY - репозиторий, откуда загружен и собран наш образ. В данном случае официальный образ взятый с hub.docker.com/_/nginx.  
    - TAG - версия нашего nginx. У нас самая последняя версия образа.  
    - IMAGE ID - ID нашего образа.  
    - CREATED - дата, когда был собран данный образ и выложен в репозиторий.  
    - SIZE - размер образа.  
## Запусти докер-образ через docker run -d [image_id|repository].  
- `docker run -d nginx`  
`Флаг -d в команде docker run используется для запуска контейнера в качестве отдельного процесса.`  
![docker_run_nginx](./images/part1/03.png)  
## Проверь, что образ запустился через docker ps.  
- `docker ps`  
![docker_ps](./images/part1/04.png)  
    - CONTAINER ID - ID нашего контейнера.  
    - IMAGE - название нашего изображения.  
    - COMMAND - это инструкция которая выполняется при запуске контейнера Docker. В данную инструкцию мы можем поместить все те команды, которые необходимы запускать каждый раз при перезагрузке контейнера. Чтоб не делать данные действия вручную.  
    - CREATED - дата, когда мы собрали наш контейнер.  
    - STATUS - текущий статус контейнера.  
    - PORTS - порты которые открыты в контейнере и на которые он принимает соединение.  
    - NAMES - название нашего контейнера.  
## Посмотри информацию о контейнере через docker inspect [container_id|container_name].  
- `docker inspect 402c9abd862a`  
`Docker inspect — это инструмент в экосистеме Docker, который предоставляет детальную информацию о контейнерах и образах Docker.`  
![docker_inspect_container](./images/part1/05.png)  
## По выводу команды определи и помести в отчёт размер контейнера, список замапленных портов и ip контейнера.  
![size_port_ip](./images/part1/06.png)  
## Останови докер образ через docker stop [container_id|container_name].  
- `docker stop magical_wright`  
![docker_stop](./images/part1/07.png)  
## Проверь, что образ остановился через docker ps.  
![docker_ps](./images/part1/08.png)  
## Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run.  
- `docker run -d -p 80:80 -p 443:443 nginx`  
![docker_run_80/443](./images/part1/09.png)  
## Check that the nginx start page is available in the browser at localhost:80.  
![localhost:80](./images/part1/10.png)  
## Restart docker container with docker restart [container_id|container_name].  
- `docker restart clever_yonath`  
![docker_restart](./images/part1/11.png)  
## Check in any way that the container is running.  
![docker_restart_check](./images/part1/12.png)  

# Part 2. Операции с контейнером  
## Прочитай конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*.  
- `docker exec [OPTIONS] CONTAINER COMMAND [ARG..]` -> `docker exec [CONTAINER] cat [FILE_PATH]` -> `docker exec musing_mahavira cat /etc/nginx/nginx.conf`  
![docker_exec](./images/part2/01.png)  
## Создай на локальной машине файл *nginx.conf*.  
- `touch nginx.conf` -> скопировал настройки из conf докера  
## Настрой в нем по пути */status* отдачу страницы статуса сервера **nginx**.  
![location](./images/part2/02.png)  
## Скопируй созданный файл *nginx.conf* внутрь докер-образа через команду `docker cp`.  
- `docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH` -> `docker cp [SRC_PATH] [CONTAINER:DEST_PATH]` -> `docker cp nginx.conf f5cfd11922ce:/etc/nginx/`  
![docker_cp](./images/part2/03.png)  
## Перезапусти **nginx** внутри докер-образа через команду *exec*.  
- `docker exec f5cfd11922ce nginx -s reload`  
![docker_reload](./images/part2/04.png)  
## Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**.  
- open browser or `curl localhost:80/status`  
![check_localhost_status](./images/part2/05.png)  
## Экспортируй контейнер в файл *container.tar* через команду *export*.  
- `docker export f5cfd11922ce > container.tar`  
![export](./images/part2/06.png)  
## Останови контейнер.  
- `docker stop f5cfd11922ce`  
![stop_container](./images/part2/07.png)  
## Удали образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры.  
- `docker rmi --force 2ac752d7aeb1`  
![docker_remove](./images/part2/08.png)  
`При удалении docker-образа выдает ошибку, так как контейнер все еще существует. При использовании флага -f или --force происходит принудительное удаление`  
## Удали остановленный контейнер.  
- `docker rm [CONTAINER]`  
![docker_rm_container](./images/part2/09.png)  
## Импортируй контейнер обратно через команду *import*.  
- `docker import [archive_name] [Image_name]` -> `docker import -c 'CMD ["nginx", "-g", "daemon off;"]' container.tar ngld`  
![docker_import](./images/part2/10.png)  
## Запусти импортированный контейнер.  
- `docker run -d -p 80:80 -p 443:443 ngld`  
![docker_run](./images/part2/11.png)  
## Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**.  
![check_localhost](./images/part2/12.png)  

# Part 3. Мини веб-сервер  
- Для выполнения последующих заданий потребуется установленная FCGI либа `apt install gcc spawn-fcgi libfcgi-dev`  
- Запустил контейнер через 81 порт `docker run -d -p 81:81 ngld`  
## Напиши мини-сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`.  
![fcgi](./images/part3/01.png)  
## Запусти написанный мини-сервер через *spawn-fcgi* на порту 8080.  
- Написанный мини-сервер скопируем в контейнер. `docker cp hwrld_fcgi.c 758ff04bb678:/home`  
- Зайдем в контейнер `docker exec -it 758ff04bb678 bash`
![cp_hwrld](./images/part3/02.png)  
- `apt install gcc spawn-fcgi libfcgi-dev`  
- `gcc -o server_fcgi hwrld_fcgi.c -lfcgi`  
- `spawn-fcgi -p 8080 ./server_fcgi`  
![spawn_fcgi](./images/part3/03.png)  
## Напиши свой *nginx.conf*, который будет проксировать все запросы с 81 порта на *127.0.0.1:8080*.  
![nginx_conf](./images/part3/04.png)  
![nginx_conf](./images/part3/05.png)  
- `docker exec 758ff04bb678 nginx -s reload`  
## Проверь, что в браузере по *localhost:81* отдается написанная тобой страничка.  
![check_browser](./images/part3/06.png)
## Положи файл *nginx.conf* по пути *./nginx/nginx.conf* (это понадобится позже).  
![nginx_conf_cp](./images/part3/05.png)  

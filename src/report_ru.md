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
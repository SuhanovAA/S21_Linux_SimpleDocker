# Part 1. Ready-made docker  
- `apt install docker.io`  
## Take the official docker image from nginx and download it using docker pull.   
- `docker pull nginx`  
![docker_pull_nginx](./images/part1/01.png)  
`The image has been downloaded and assembled on our server.`  
## Check for the docker image with docker images.  
- `docker images`    
![docker_images](./images/part1/02.png)  
`To check the images that are already installed and available on our server, use the command: docker images`  
    - REPOSITORY - the repository from where our image is downloaded and assembled. In this case, the official image taken from hub.docker.com/_/nginx.  
    - TAG is the version of our nginx. We have the latest version of the image.  
    - IMAGE ID - The ID of our image.  
    - CREATED - the date when this image was assembled and uploaded to the repository.  
    - SIZE - the size of the image.  
## Run docker image with docker run -d [image_id|repository].  
- `docker run -d nginx`  
`The -d flag in the docker run command is used to run the container as a separate process.`  
![docker_run_nginx](./images/part1/03.png)  
## Check that the image is running with docker ps.  
- `docker ps`  
![docker_ps](./images/part1/04.png)  
    - CONTAINER ID - The ID of our container. 
    - IMAGE - the name of our image. 
    - COMMAND is an instruction that is executed when the Docker container is launched. In this instruction, we can put all those commands that need to be run every time the container is restarted. In order not to do these actions manually. 
    - CREATED - the date when we assembled our container. 
    - STATUS - the current status of the container. 
    - PORTS - ports that are open in the container and to which it accepts a connection. 
    - NAMES is the name of our container.
## View container information with docker inspect [container_id|container_name].  
- `docker inspect 402c9abd862a`  
`Docker inspect is a tool in the Docker ecosystem that provides detailed information about Docker containers and images.`  
![docker_inspect_container](./images/part1/05.png)  
## From the command output define and write in the report the container size, list of mapped ports and container ip.  
![size_port_ip](./images/part1/06.png)  
## Stop docker image with docker stop [container_id|container_name].  
- `docker stop magical_wright`  
![docker_stop](./images/part1/07.png)  
## Check that the image has stopped with docker ps.  
![docker_ps](./images/part1/08.png)  
## Run docker with ports 80 and 443 in container, mapped to the same ports on the local machine, with run command.  
- `docker run -d -p 80:80 -p 443:443 nginx`  
![docker_run_80/443](./images/part1/09.png)  
## Проверь, что в браузере по адресу localhost:80 доступна стартовая страница nginx.  
![localhost:80](./images/part1/10.png)  
## Перезапусти докер контейнер через docker restart [container_id|container_name].  
- `docker restart clever_yonath`  
![docker_restart](./images/part1/11.png)  
## Проверь любым способом, что контейнер запустился.  
![docker_restart_check](./images/part1/12.png)  
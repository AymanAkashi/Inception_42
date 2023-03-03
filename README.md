# Inception_42
This project is an introduction to Docker. It aims at setting up multiple services using Docker containers.
<br>
<br>
<h3>What is Docker</h3>

![docker](assets/docker-image.jpg)


[Docker](https://docs.docker.com/get-started/) is a software platform designed to help developers build, share, and run modern applications. It allows you to package your application and its dependencies into a standardized unit called a container, which can be easily shared and run on any machine that has Docker installed.

<br>
<h3>What is Containers : </h3>

A [container](https://docs.docker.com/get-started/02_our_app/) is a lightweight, standalone, executable package of software that includes everything needed to run an application. It consists of an entire runtime environment, including the application code, runtime, system tools, libraries, and settings. Containers are isolated from each other and from the host system, which makes them portable and easy to deploy across different environments.

<br><hr>
<h3>Different between container and VM </h3>

The primary difference between containers and virtual machines is that containers provide a way to virtualize an OS so that the same code can run on any device, while virtual machines virtualize an entire machine down to the hardware layers. Containers are small, fast, and portable because they do not need to include a guest OS in every instance, while virtual machines require a full copy of the operating system for each instance.
#### Downside of VMs

- Each vm needs a. full-blown OS
- Slow to start
- Resource intensive

#### Advantages of Containers

- Allow running multiple apps in isolation
- are lightweight process
- use OS of the host
- Start quickly
- Need less hardware resources

![container-vs-VM](assets/Docker-vs-VM.png)

<h3>Docker images</h3>

A Docker image is a read-only template that contains a set of instructions for creating a container that can run on the Docker platform. It provides a convenient way to package up applications and preconfigured server environments, which you can use for your own private use or share publicly with other Docker users.A Docker image includes everything needed to run an application, such as the application code, runtime, system tools, libraries, and settings.

![images](assets/Docker-images.jpeg)

Additional ressources:<br>
[Docker in 100 seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ).<br>
[Docker docs](https://docs.docker.com/).

### Important commands to use docker
<hr>
General docker commands:
<br>

```sh
docker ps # Show currently running containers

docker pull "NameOfTheImage" # pull an image from dockerhub.

docker rm <container_name> # Delete docker containers.

docker exec -it <container_name> "command" "arg1" "arg2" ... # Execute command in the container.

docker run <image_name> # Run the docker image
```
<hr>

### What's Dockerfile<br>
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.
<br><br>

### Example of Dockerfile
<br>

```Dockerfile
FROM debian:buster # Base image
WORKDIR /app 
COPY src dest
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
```



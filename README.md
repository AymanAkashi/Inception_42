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

#### Example of Dockerfile
<br>

```Dockerfile
FROM debian:buster # Base image
WORKDIR /app 
COPY src dest
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
```
<hr><br>

<h3><li> What Docker Compose solves ?</li></h3>

<br>

First, Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to define the services that make up your application in a YAML file, which can then be used to start and stop all the containers at once.<br><br>
The main difference between Docker and Docker Compose is that Docker is used to build, run, and manage individual containers, while Docker Compose is used to define and run multi-container applications.

### Example of docker-compose.yml :
<br>

```yml
version: "3.9"
services:
  web:
    build: . # Dockerfile Path
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"
```
<hr><br>

## NGINX

* [NGINX](https://www.youtube.com/watch?v=JKxlsvZXG7c)  is open source software for web serving, reverse proxying, caching, load balancing, media streaming.

For Dockerfile

```Dockerfile
FROM 	alpine:3.16.4

COPY 	./conf/nginx.conf /etc/nginx/nginx.conf

COPY 	./tools/script.sh /

RUN     sh ../script.sh

EXPOSE 	443 
CMD 	["nginx", "-g", "daemon off;"]
```

in script i configurate Secure Sockets Layer or [SSL](https://www.cloudflare.com/learning/ssl/what-is-ssl/), and the configuration of nginx i set up in nginx.conf file here i [Full Example Configuration](https://www.nginx.com/resources/wiki/start/topics/examples/full/) of them.

For configurate SSL we need to download `openssl` in your OS. but  you have to know what's [HTTP](https://www.cloudflare.com/learning/ddos/glossary/hypertext-transfer-protocol-http/), [HTTPS](https://www.cloudflare.com/learning/ssl/what-is-https/) and what is an [SSL Certificate](https://www.cloudflare.com/learning/ssl/what-is-an-ssl-certificate/)?

You can create a self-signed key and certificate pair with OpenSSL in a single command:
```sh
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```

<details>
<summary>Command explining Here</summary>

-`openssl`: This is the basic command line tool for creating and managing OpenSSL certificates, keys, and other files.<br>
-`req`: This subcommand specifies that we want to use X.509 certificate signing request (CSR) management. The “X.509” is a public key infrastructure standard that SSL and TLS adheres to for its key and certificate management. We want to create a new X.509 cert, so we are using this subcommand.<br>
-`x509`: This further modifies the previous subcommand by telling the utility that we want to make a self-signed certificate instead of generating a certificate signing request, as would normally happen.<br>
-`nodes`: This tells OpenSSL to skip the option to secure our certificate with a passphrase. We need Nginx to be able to read the file, without user intervention, when the server starts up. A passphrase would prevent this from happening because we would have to enter it after every restart.<br>
-`days 365`: This option sets the length of time that the certificate will be considered valid. We set it for one year here.<br>
-`newkey rsa:2048`: This specifies that we want to generate a new certificate and a new key at the same time. We did not create the key that is required to sign the certificate in a previous step, so we need to create it along with the certificate. The rsa:2048 portion tells it to make an RSA key that is 2048 bits long.<br>
-`keyout`: This line tells OpenSSL where to place the generated private key file that we are creating.<br>
-`out`: This tells OpenSSL where to place the certificate that we are creating.

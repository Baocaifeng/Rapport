### scala-jre8-alpine

- A light and simple scala docker container running in alpine Linux with curl and git.
- Alpine is a tiny linux OS.
- This container has only jre (no jdk), it's for pure scala, doesn't support java program.
- It's only 84M, ideally using in small scala project.

[![dockeri.co](https://dockeri.co/image/baocaifeng/scala-jre8-alpine)](https://hub.docker.com/r/baocaifeng/scala-jre8-alpine)


[Scala](https://www.scala-lang.org/)

> Scala combines object-oriented and functional programming in one concise, high-level language. 
> Scala's static types help avoid bugs in complex applications, and its JVM and JavaScript runtimes 
> let you build high-performance systems with easy access to huge ecosystems of libraries.

[Docker](https://www.docker.com/)

> Docker is a containerized system, which can run on Windows, Linux, and Mac OS. It can easily package and transfer development environments.
### how to use

1. Install Docker
2. Pull the scala-jre8-alpine image from DockerHub
```
docker pull baocaifeng/scala-jre8-alpine:1.0
```
3. Build image 
> You can also dowload Dockerfile from github and build it by yourself. 
> To build, you need to specify the desired openjdk and scala versions via `--build-arg` parameters.
```
docker build --build-arg OPENJDK_TAG=<Your Openjdk Tag> --build-arg SCALA_VERSION=<Your Scala version> .
# by default, OPENJDK_TAG=8u151-jre-alpine, SCALA_VERSION=2.13.5
```

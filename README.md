# latex-docker-env

A docker environment for compiling latex files  
(`ipaex-type1` package is initially introduced in the environment)

# Usage

```shell
$ docker build -t latex-docker-env ./
$ docker run -it --rm -v $PWD:/workdir latex-docker-env:latest make FILE=<tex file name without extension>
```

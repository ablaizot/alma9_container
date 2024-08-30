Build with  `docker build --progress=plain --no-cache --platform="linux/amd64" -t test -f ./Dockerfile`

I was trying to update the following container to alma9: https://hub.docker.com/r/dgastler/multiarch-butool-almalinux8

Using `docker history [IMAGE ID] --no-trunc`, you can recreate the docker file.

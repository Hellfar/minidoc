Docker
======

## Install

### Debian
- Set up Docker's apt repository.
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

- Install the Docker packages.
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- You might want to verify if the installation is successful.
```
sudo docker run hello-world
```

### Ubuntu (and Mint)

- Set up Docker's apt repository.
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources (Use UBUNTU_CODENAME instead of VERSION_CODENAME for Mint):
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

- Install the Docker packages.
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- You might want to verify if the installation is successful.
```
sudo docker run hello-world
```

## Run Docker without `sudo`

From this [documentation](https://docs.docker.com/engine/install/linux-postinstall/).

```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
# Verify that you can run docker commands without sudo.
docker run hello-world
```

## List

```
docker ps -a # Lists all containers (running and stopped).
docker ps -a -q # Same, but prints only IDs.
docker image ls # Lists all images (downloaded and built).
docker images # Do the same.
docker images ls # Output empty table....  

docker network ls # List the networks.
```

## Stop and remove images

```
docker stop CONTAINER_(ID or NAME) # Stops an image with a container ID.
docker stop $(docker ps -a -q) # Stops all containers.
docker rm $(docker ps -a -q) # Removes all containers.
docker image remove IMAGE_ID # Removes an image (can be grouped separated with a space).
docker image rm $(docker image ls -a -q) # Removes all images.
```

```
docker image remove rails-6 # Un-tags an image (`rails-6` here being the tag targeted).
```

```
service docker stop # Stops Docker completely.
```

## Run

```
docker run --name CONTAINER_NAME IMAGE_(ID or NAME) # Runs an image and set a container name.
# Use `-d` (for detach) in order to run the container up until you ask it to stop.
docker run -d --name CONTAINER_NAME IMAGE_(ID or NAME)
```

```
docker exec -it CONTAINER_(ID or NAME) bash # Logs into the terminal of a container.
```

```
# `-p` will override the `EXPOSE` command.
docker run -p 3000:3000 rails-6:latest "bash" "-cl" "rails s" # Run a command in your latest image.
# The command above wont work as rails will serve in docker to 127.0.0.1 instead of localhost.
docker run -p 3000:3000 rails-6:latest "bash" "-cl" "rails s -b 0.0.0.0 -p 3000" # This command will fix the issue.
```

## Links

[Dockerfile(builder) ref](https://docs.docker.com/engine/reference/builder/)
[Work over shared volums](https://docs.docker.com/storage/volumes/)

[Understanding about login-shell in a docker image](https://www.theguild.nl/nvm-in-docker/)

[About project code into a container](https://forums.docker.com/t/best-practices-for-getting-code-into-a-container-git-clone-vs-copy-vs-data-container/4077)

[https://hub.docker.com/](https://hub.docker.com/)

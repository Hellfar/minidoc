Docker
======

## List

```
sudo docker ps -a # Lists all containers (running and stopped).
sudo docker ps -a -q # Same, but prints only IDs.
sudo docker image ls # Lists all images (downloaded and builded).
```

## Stop and remove images

```
sudo docker stop CONTAINER_(ID or NAME) # Stops an image with a container ID.
sudo docker stop $(sudo docker ps -a -q) # Stops all containers.
sudo docker rm $(sudo docker ps -a -q) # Removes all containers.
sudo docker image remove IMAGE_ID # Removes an image (can be grouped separated with a space).
sudo docker image rm $(sudo docker image ls -a -q) # Removes all images.
```

```
sudo docker image remove rails-6 # Un-tags an image (`rails-6` here being the tag targeted).
```

```
sudo service docker stop # Stops Docker completely.
```

## Run

```
sudo docker run --name CONTAINER_NAME IMAGE_(ID or NAME) # Runs an image and set a container name.
# Use `-d` (for detach) in order to run the container up until you ask it to stop.
sudo docker run -d --name CONTAINER_NAME IMAGE_(ID or NAME)
```

```
sudo docker exec -it CONTAINER_(ID or NAME) bash # Logs into the terminal of a container.
```

```
# `-p` will override the `EXPOSE` command.
sudo docker run -p 3000:3000 rails-6:latest "bash" "-cl" "rails s" # Run a command in your latest image.
# The command above wont work as rails will serve in docker to 127.0.0.1 instead of localhost.
sudo docker run -p 3000:3000 rails-6:latest "bash" "-cl" "rails s -b 0.0.0.0 -p 3000" # This command will fix the issue.
```

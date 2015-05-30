# Docker YouTrack

Docker container for the deployment of a [YouTrack](https://www.jetbrains.com/youtrack/) server.

## Starting the container

To start the container use following command:

```
docker run --name some_youtrack -d alonsodomin/youtrack
```

## Exposing the server port

The YouTrack server will be started and exposed on port 8080. To expose the port in the host machine just add
a port mapping to the `docker run` command:

```
docker run --name some_youtrack -d -p 8080:8080 alonsodomin/youtrack
```

## Database location

The YouTrack database will be created in the path `/var/lib/youtrack` inside the container and it's exposed as a 
volume. For production deployments it's recommended to mount the volume in the host machine so the data can be
easily recovered when updating the image and/or a container failure.

Following command would mount the YouTrack database in the host location `/my/db/location`.

```
docker run --name some_youtrack -d -v /my/db/location:/var/lib/youtrack alonsodomin/youtrack
```

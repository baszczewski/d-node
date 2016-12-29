baszczewski-node
==================

Usage
-----

To create the image `baszczewski/node`, execute the following command on the folder:

	docker build -t baszczewski/node .

Running
------------------------------
```bash
docker run -it --link mariadb:database -p 4040:4040 -v /home/user/data:/data:Z --name node baszczewski/node
```

```bash
docker run -it -p 4040:4040 -v /mnt/dysk/Docker/data/www:/data:z --name node baszczewski/node
```

Enter running container
-----------------------
```bash
sudo docker exec -it CONTAINER_ID bash
```
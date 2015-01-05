Zonstack
========

Horizon running on Docker project. Dockerfile does assume a local_settings.py file in the dockerfile dir with custom settings.

### BUILD

Sample docker build command:

```
sudo docker build -t zonstack .
```

### RUN

Sample docker run command:

```
sudo docker run -d -p 49160:8000 zonstack
```

Once the container is running, point your browser to 0.0.0.0:49160 to test. You should see a Horizon login page. 

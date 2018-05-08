# docker-SikuliLibrary
docker for robotframework-SikuliLibrary

### How to use?
1. if you want to open SSH.
```
docker run --name sikuli -p32222:22 -p31818:18181 --rm -it yingjun/robotframework-SikuliLibrary
```
2. if you only want to run SikuliLibrary
```
docker run --name sikuli -p31818:18181 --rm -it yingjun/robotframework-SikuliLibrary
```

```

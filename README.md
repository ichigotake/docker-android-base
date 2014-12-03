## Android development environment for ubuntu 14.04 LTS

### Work in progress

Now deploying...

### Environment

* Oracle Java JDK 6 as set $JAVA6\_HOME
* Oracle Java JDK 7 as set $JAVA7\_HOME by default $JAVA\_HOME
* Oracle Java JDK 8 as set $JAVA8\_HOME for retrolambda
* Android SDK r23.0.2

### Install

You can either pull from `ichigotake/docker-android-dev`:

```
docker pull ichigotake/docker-android-dev
```

```
docker run -i -t ichigotake/docker-android-dev /bin/bash
```

or add it to your Dockerfile:

```
FROM ichigotake/docker-android-dev
```

### License

This repository forked from [vmlinz/docker-android-dev](https://github.com/vmlinz/docker-android-dev).

[MIT LICENSE](LICENSE)



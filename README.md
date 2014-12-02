## Android development environment for ubuntu 14.04 LTS

### Work in progress

Now deploying...

### Encironment

* Oracle Java JDK 7
* Android SDK r23.0.2
* Gradle 2.0

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



## Android development environment for ubuntu 14.04 LTS

### Work in progress

Now deploying...
o### Synopsis

[Example use case](https://github.com/ichigotake/Pyazing/blob/v1.8/Dockerfile)

```
FROM ichigotake/docker-android-dev

MAINTAINER ichigotake <ichigotake.san@gmail.com>

ENV APP_ROOT /opt/Application

# Download repository
RUN apt-get install git
RUN git clone https://github.com/ichigotake/Pyazing $APP_ROOT

# Resolve dependencies
# with sdk-manager-plugin (https://github.com/JakeWharton/sdk-manager-plugin) in Pyazing project.
RUN cd $APP_ROOT && ./gradlew

...
```

I reccomend use [sdk-manager-plugin](https://github.com/JakeWharton/sdk-manager-plugin) on your project.

(or install the sdk yourself with [android-sdk-installer](https://github.com/embarkmobile/android-sdk-installer/))

### Environment

* Oracle Java JDK 6 as set $JAVA6\_HOME
* Oracle Java JDK 7 as set $JAVA7\_HOME by default $JAVA\_HOME
* Oracle Java JDK 8 as set $JAVA8\_HOME for retrolambda
* Android SDK
    * tools r23.0.2
    * platform-tools
    * build-tools r21.1.1
    * android-21
    * extra-android-support
    * extra-android-m2repository
    * extra-google-m2repository

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



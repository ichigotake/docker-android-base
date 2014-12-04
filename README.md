## Android development environment for ubuntu 14.04 LTS

### Work in progress

Now deploying...

### Encironment

* Oracle Java JDK 6 as set $JAVA6\_HOME
* Oracle Java JDK 7 as set $JAVA7\_HOME by default $JAVA\_HOME
* Oracle Java JDK 8 as set $JAVA8\_HOME for retrolambda
* Android SDK
    * tools r23.0.2
    * platform-tools
    * extra-android-support
    * extra-android-m2repository
    * extra-google-m2repository

This image not included `build-tools`, `android-sdk`, `emulator` and other items, because to diet  base image for a small size binary.

I reccomend use [sdk-manager-plugin](https://github.com/JakeWharton/sdk-manager-plugin) on your project.

(or install the sdk yourself with [android-sdk-installer](https://github.com/embarkmobile/android-sdk-installer/))

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



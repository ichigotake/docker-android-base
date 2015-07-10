FROM ubuntu:14.04

MAINTAINER ichigotake <ichigotake.san@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common &&\
    dpkg --add-architecture i386 && add-apt-repository ppa:webupd8team/java && apt-get update &&\
    echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections &&\
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections &&\
    apt-get -y install \
        python-software-properties \
        bzip2 unzip openssh-client git \
        lib32stdc++6 lib32z1 curl\
        build-essential oracle-java8-installer &&\
    apt-get clean

# Environment variables
ENV JAVA8_HOME /usr/lib/jvm/java-8-oracle
ENV JAVA_HOME $JAVA8_HOME
ENV ANDROID_SDK_REVISION 24.3.2
ENV ANDROID_SDK_URL http://dl.google.com/android/android-sdk_r${ANDROID_SDK_REVISION}-linux.tgz
ENV ANDROID_SDK_COMPONENTS tools,platform-tools,build-tools-22.0.1,build-tools-20.0.0,android-22,android-20,extra-android-support,extra-android-m2repository,extra-google-m2repository
ENV ANDROID_SDK_HOME /usr/local/android-sdk-linux
ENV ANDROID_HOME $ANDROID_SDK_HOME
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools

RUN curl -L "$ANDROID_SDK_URL" | tar --no-same-owner -xz -C /usr/local
RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"


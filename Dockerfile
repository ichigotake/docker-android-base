# Android development environment based on Ubuntu 14.04 LTS.
# r24.1.2

FROM phusion/baseimage

MAINTAINER ichigotake <ichigotake.san@gmail.com>

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN add-apt-repository ppa:webupd8team/java

# First, install add-apt-repository and bzip2
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install \
        software-properties-common python-software-properties \
        bzip2 unzip openssh-client git \
        lib32stdc++6 lib32z1 \
        build-essential

apt-get -y install \
    oracle-java8-installer \
    oracle-java7-installer \
    oracle-java6-installer

RUN apt-get clean

# Environment variables
ENV ANDROID_SDK_URL http://dl.google.com/android/android-sdk_r24.1.2-linux.tgz
ENV ANDROID_SDK_COMPONENTS tools,platform-tools,build-tools-24.1.2,android-22,android-20,extra-android-support,extra-android-m2repository,extra-google-m2repository
ENV ANDROID_SDK_HOME /usr/local/android-sdk-linux
ENV ANDROID_HOME $ANDROID_SDK_HOME
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools
ENV JAVA6_HOME /usr/lib/jvm/java-6-oracle
ENV JAVA7_HOME /usr/lib/jvm/java-7-oracle
ENV JAVA8_HOME /usr/lib/jvm/java-8-oracle
ENV JAVA_HOME $JAVA7_HOME

RUN curl -L "${ANDROID_SDK_URL}" | tar --no-same-owner -xz /usr/local
RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"


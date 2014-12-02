# Android development environment based on Ubuntu 14.04 LTS.
# version 0.0.1

# - https://services.gradle.org/distributions/gradle-2.0-bin.zip
# - http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz

# Start with Ubuntu 14.04 LTS.
FROM phusion/baseimage

MAINTAINER ichigotake <ichigotake.san@gmail.com>

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

# First, install add-apt-repository and bzip2
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install \
software-properties-common python-software-properties \
bzip2 unzip openssh-client git \
lib32stdc++6 lib32z1 \
expect build-essential

# Add oracle-jdk7 to repositories
RUN add-apt-repository ppa:webupd8team/java

# Update apt
RUN apt-get update

# Install oracle-jdk7
RUN apt-get -y install oracle-java7-installer

RUN curl -3L https://github.com/vmlinz/android-sdk-installer/raw/master/android-sdk-installer | bash /dev/stdin --install="tools,platform-tools,build-tools-21.1.1,android-21,sys-img-armeabi-v7a-android-21,extra-android-support,extra-android-m2repository,extra-google-m2repository" --dir="/opt" --accept="android-sdk-license-5be876d5|android-sdk-preview-license-52d11cd2"

# Install Gradle
RUN wget https://services.gradle.org/distributions/gradle-2.0-bin.zip
RUN unzip gradle-2.0-bin.zip
RUN mv gradle-2.0 /opt/
RUN rm gradle-2.0-bin.zip

# Environment variables
ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_NDK_HOME /opt/android-ndk-r9d
ENV ANDROID_HOME $ANDROID_SDK_HOME
ENV GRADLE_HOME /opt/gradle-2.0
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools
ENV PATH $PATH:$GRADLE_HOME/bin

# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Clean up
RUN apt-get clean


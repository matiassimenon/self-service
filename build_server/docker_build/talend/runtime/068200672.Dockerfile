FROM ubuntu:12.04

MAINTAINER Francisco Duran <franciscogd@gatech.edu>

# Update OS and Install Tools
RUN apt-get update && apt-get install -y software-properties-common wget tar unzip vim
# Set environment variables for Java version
ENV JDK_VERSION 8
ENV JDK_UPDATE 141
ENV JDK_BUILD b15
ENV JDK_DISTRO_ARCH linux-x64
ENV JCE_FOLDER UnlimitedJCEPolicyJDK$JDK_VERSION
ENV JDK_FOLDER jdk1.$JDK_VERSION.0_$JDK_UPDATE
ENV JDK_VERSION_UPDATE $JDK_VERSION'u'$JDK_UPDATE
ENV JDK_VERSION_UPDATE_BUILD $JDK_VERSION_UPDATE'-'$JDK_BUILD
ENV JDK_VERSION_UPDATE_DISTRO_ARCH $JDK_VERSION_UPDATE'-'$JDK_DISTRO_ARCH
ENV JAVA_HOME /opt/java
ENV JRE_SECURITY_FOLDER $JAVA_HOME/jre/lib/security
ENV SSL_TRUSTED_CERTS_FOLDER /opt/ssl/trusted

# Define working directory opt
WORKDIR /opt

#Install Java
RUN wget --no-check-certificate https://github.com/frekele/oracle-java/releases/download/${JDK_VERSION_UPDATE_BUILD}/jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz \
    && wget --no-check-certificate https://github.com/frekele/oracle-java/releases/download/${JDK_VERSION_UPDATE_BUILD}/jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz.md5 \
    && echo "$(cat jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz.md5) *jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz" | md5sum -c \
    && tar -zvxf jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz -C /opt \
    && ln -s /opt/${JDK_FOLDER} /opt/java \
    && rm -f jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz \
    && rm -f jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz.md5

# Download zip file with java cryptography extension and unzip to jre security folder
RUN wget --no-check-certificate https://github.com/frekele/oracle-java/releases/download/oracle_jce${JDK_VERSION}/jce_policy-${JDK_VERSION}.zip \
    && unzip jce_policy-${JDK_VERSION}.zip \
    && cp ${JCE_FOLDER}/*.jar ${JRE_SECURITY_FOLDER} \
    && rm -f jce_policy-${JDK_VERSION}.zip \
    && rm -rf ${JCE_FOLDER}

# Add executables to path
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/java/bin/java" 1 && update-alternatives --set "java" "/opt/java/bin/java" && update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/bin/javac" 1 && update-alternatives --set "javac" "/opt/java/bin/javac" && update-alternatives --install "/usr/bin/keytool" "keytool" "/opt/java/bin/keytool" 1 && update-alternatives --set "keytool" "/opt/java/bin/keytool" 

# Clean all cached files
RUN apt-get clean all

# Expose Talend Application Ports
EXPOSE 8040 8000 8001 8888 9001

# Define working directory
WORKDIR /talend

# Install runtime
ADD Talend-Runtime-V6.2.1-20160630132202.zip /talend

RUN \
  unzip /talend/Talend-Runtime-V6.2.1-20160630132202.zip -d /talend/runtime-621 && \
  rm -rf /talend/Talend-Runtime-V6.2.1-20160630132202.zip && \
  chmod +x /talend/runtime-621/bin/*

USER root
# Define Default command
ENTRYPOINT "/talend/runtime-621/bin/start" && /bin/bash
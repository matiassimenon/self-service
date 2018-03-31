FROM centos:7.4.1708
# Update OS and Install Tools
RUN yum update -y && yum install -y wget tar unzip vim
# Set environment variables for Java version
ENV JDK_VERSION 8
ENV JDK_UPDATE 144
ENV JDK_BUILD b01
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
    && echo "$(cat jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz.md5) jdk-${JDK_VERSION_UPDATE_DISTRO_ARCH}.tar.gz" | md5sum -c \
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
RUN alternatives --install "/usr/bin/java" "java" "/opt/java/bin/java" 1 && alternatives --set "java" "/opt/java/bin/java" && alternatives --install "/usr/bin/javac" "javac" "/opt/java/bin/javac" 1 && alternatives --set "javac" "/opt/java/bin/javac" && alternatives --install "/usr/bin/keytool" "keytool" "/opt/java/bin/keytool" 1 && alternatives --set "keytool" "/opt/java/bin/keytool" 

# Clean all cached files
RUN yum clean all

# Expose Talend Application Ports
EXPOSE 8002

# Define working directory talend
WORKDIR /talend

# Install cmdline
ADD Talend-Studio-20170623_1246-V6.4.1.zip /talend
ADD start_cmdline.sh /talend
ADD stop_cmdline.sh /talend
ADD telnet.jar /talend

RUN unzip /talend/Talend-Studio-20170623_1246-V6.4.1.zip && \
    mv /talend/Talend-Studio-20170623_1246-V6.4.1 /talend/cmdline && \
    rm -rf /talend/Talend-Studio-20170623_1246-V6.4.1.zip

RUN chmod +x -R /talend/*.sh

USER root
ENTRYPOINT "/talend/start_cmdline.sh" && /bin/bash
FROM ubuntu:16.04
# Update OS and Install Tools
RUN apt-get update && apt-get install -y software-properties-common wget tar unzip vim
# Set environment variables for Java version
ENV JDK_VERSION 8
ENV JDK_UPDATE 162
ENV JDK_BUILD b12
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
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/java/bin/java" 1 && update-alternatives --set "java" "/opt/java/bin/java" && update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/bin/javac" 1 && update-alternatives --set "javac" "/opt/java/bin/javac" && update-alternatives --install "/usr/bin/keytool" "keytool" "/opt/java/bin/keytool" 1 && update-alternatives --set "keytool" "/opt/java/bin/keytool" 

# Set environment variables for Tomcat version
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.50

# Install Tomcat
RUN wget http://mirrors.koehn.com/apache/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    rm apache-tomcat*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}
RUN chmod +x ${CATALINA_HOME}/bin/*sh
# Create Tomcat admin user
ADD create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
ADD tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
RUN chmod +x $CATALINA_HOME/scripts/*.sh
# Create tomcat user
RUN groupadd -r tomcat && \
    useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
    chown -R tomcat:tomcat ${CATALINA_HOME}
# Last step of Tomcat install comes after installing TAC

# Clean all cached files
RUN apt-get clean all

# Expose Talend Application Ports
# Apache Tomcat port [8080]
EXPOSE 8080
# Apache Tomcat AJP Connector Port [8009]
EXPOSE 8009
# MySQL 5.7 database port [3306]
EXPOSE 3306
# Oracle 12c database [1521]
EXPOSE 1521
# MS SQL Server [1433]
EXPOSE 1433
# PostgreSQL 9.6 database [5432]
EXPOSE 5432
# Nexus port [8081]
EXPOSE 8081

# Define working directory
WORKDIR /talend

# Install TAC
ADD Talend-AdministrationCenter-20150908_1633-V6.0.1.zip /talend

RUN unzip /talend/Talend-AdministrationCenter-20150908_1633-V6.0.1.zip && \
    mv /talend/Talend-AdministrationCenter-20150908_1633-V6.0.1 /talend/tac-601 && \
    rm -rf /talend/Talend-AdministrationCenter-20150908_1633-V6.0.1.zip && \
    mkdir -p /Talend/CommandLine/exports /Talend/Administrator/generatedJobs /Talend/Administrator/executionLogs /Talend/Audit/reports

WORKDIR /opt/tomcat
# Finish tomcat install
USER tomcat
CMD ["tomcat.sh"]

USER root
RUN mv /talend/tac-601/org.talend.administrator-6.0.1.war /opt/tomcat/webapps/tac-601.war
ENTRYPOINT "/opt/tomcat/bin/startup.sh" && /bin/bash

FROM openjdk:8-jre-alpine
ARG  FUSION_CLI_VERSION=0.1.2-RELEASE
RUN  mkdir -p /opt/cli/ \
     && apk add --nocache wget \
	 && wget http://jd-fusion-pub-storage.oss.cn-north-1.jcloudcs.com/releases/cli/jar/fusion-cli-${FUSION_CLI_VERSION}.jar \
	 && mv fusion-cli-${FUSION_CLI_VERSION}.jar /opt/cli/fusion-cli.jar
WORKDIR /opt/cli/
ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Duser.timezone=Asia/Shanghai", "-Dfile.encoding=UTF-8", "-jar", "fusion-cli.jar"]

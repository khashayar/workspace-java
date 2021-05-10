FROM khashayar/workspace-base:latest

RUN set -ex && \
      apk add --no-cache --update \
        openjdk11 \
        maven

# install, build Eclipse JDT (Java Development Tool) Language Server
RUN set -ex && \
      curl -sLf https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -o jdt-language-server-latest.tar.gz && \
      mkdir /jdtls && \
      tar -xf jdt-language-server-latest.tar.gz -C /jdtls && \
      rm jdt-language-server-latest.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"
ENV JAVA_OPTS="-Xms256m -Xmx512m"

CMD ["/bin/zsh"]


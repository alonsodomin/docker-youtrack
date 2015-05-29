FROM java:8

MAINTAINER Antonio Alonso Dominguez "alonso@codenibbles.com"

ENV YOUTRACK_VERSION 6.0.12619
ENV YOUTRACK_HOME /opt/local/youtrack
ENV YOUTRACK_VAR_DIR /var/lib/youtrack

RUN mkdir -p $YOUTRACK_HOME && \
	mkdir -p $YOUTRACK_VAR_DIR && \
	mkdir -p /etc/youtrack && \
	wget -nv https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar -O $YOUTRACK_HOME/youtrack-$YOUTRACK_VERSION.jar && \
	ln -s $YOUTRACK_HOME/youtrack-$YOUTRACK_VERSION.jar $YOUTRACK_HOME/youtrack.jar

COPY conf/* /etc/youtrack/
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME [ "/etc/youtrack" ]
	
EXPOSE 8080

ENTRYPOINT [ "/docker-entrypoint.sh" ]
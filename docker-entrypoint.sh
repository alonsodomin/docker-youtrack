#!/bin/sh

# Redirect stderr so everything ends up in the log file
exec 2>&1

exec java \
	-Xmx1g \
	-Duser.home=$YOUTRACK_USER_HOME \
	-Ddatabase.location=$YOUTRACK_DB_DIR \
	-Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts -Djavax.net.ssl.trustStorePassword=changeit \
	-Djetbrains.youtrack.disableBrowser=true -Djetbrains.youtrack.enableGuest=false \
	-Djetbrains.mps.webr.log4jPath=/etc/youtrack/log4j.xml -Djava.awt.headless=true \
	-jar $YOUTRACK_HOME/youtrack.jar 8080  2>&1
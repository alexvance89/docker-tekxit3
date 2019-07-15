#!/bin/bash
megadl --path=mc.zip '${MEGA_URL}'
unzip mc.zip -d /data-temp
mv -v data-temp/*/* data/ && rm -r -f /data-temp && rm mc.zip
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xmx${INIT_MEM}" "-Xms${MAX_MEM}" -jar $jarfile nogui

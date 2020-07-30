#!/bin/bash
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xms${INIT_MEM}" "-Xmx${MAX_MEM}" -jar $jarfile nogui
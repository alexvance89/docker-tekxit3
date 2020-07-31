#!/bin/bash
shopt -s extglob; set +H
cp -ar data-temp/*/!(server.properties|ops.json|banned-ips.json|banned-players.json|whitelist.json|usercache.json) /data/
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xms${INIT_MEM}" "-Xmx${MAX_MEM}" "-XX:+UnlockExperimentalVMOptions" "-XX:+UseCGroupMemoryLimitForHeap" "-XshowSettings:vm" "-Dfml.queryResult=confirm" -jar $jarfile nogui

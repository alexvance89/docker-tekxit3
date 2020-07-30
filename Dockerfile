FROM openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

# default url to start with
ENV MEGA_URL=https://www.tekx.it/downloads/0.981Tekxit3Server.zip                                                                            
# min memory use for this modpack
ENV INIT_MEM=4G
ENV MAX_MEM=4G
#update all the things
RUN apt-get update -y && apt-get install unzip wget -y --no-install-recommends 
RUN wget ${MEGA_URL} -O mc.zip
RUN unzip mc.zip -d /data-temp
RUN mkdir /data
RUN mv -v data-temp/*/* /data
#RUN mv -v data-temp/*/!(server.properties|ops.json|banned-ips.json|banned-players.json|whitelist.json|usercache.json) data/                
RUN mv -v data-temp/* data/                                                                                                                 
RUN rm -r -f /data-temp                                                                                                                     
RUN rm -r -f ./mc.zip                                                                                                                                                                                                                                                                   #startup script
COPY ./start.sh start.sh    
#make sure startup script can run
RUN chmod +x ./start.sh

#define the volume
VOLUME [ "/data" ]
#execute startup script on startup
ENTRYPOINT [ "./start.sh" ]

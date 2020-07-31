FROM openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV URL=https://www.tekx.it/downloads/0.981Tekxit3Server.zip                                                                            
ENV INIT_MEM=4G
ENV MAX_MEM=4G

RUN apt-get update -y && apt-get install unzip wget -y --no-install-recommends 

RUN wget ${URL} -O mc.zip
RUN unzip mc.zip -d /data-temp

COPY ./start.sh start.sh    
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]

FROM --platform=linux/arm64 openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV URL=https://www.tekxit.xyz/downloads/1.0.5.2TekxitPi.zip                                                                          
ENV INIT_MEM=2G
ENV MAX_MEM=3G

RUN apt-get update -y && apt-get install unzip wget -y --no-install-recommends 

RUN wget ${URL} -O mc.zip
RUN unzip mc.zip -d /data-temp

COPY ./start.sh start.sh    
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]

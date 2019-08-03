FROM ubuntu:latest

WORKDIR /

EXPOSE 25565 25565

# default url to start with
ENV MEGA_URL=https://www.tekx.it/downloads/0.94Tekxit3Server.zip
# min memory use for this modpack
ENV INIT_MEM=4G
# max mem that we should let java use
ENV MAX_MEM=8G

#update all the things
RUN apt-get update -y
#install the things
RUN apt-get install unzip wget openjdk-8-jre -y
#startup script
COPY ./start.sh start.sh
#make sure startup script can run
RUN chmod +x ./start.sh
#define the volume
VOLUME [ "/data" ]
#execute startup script on startup
ENTRYPOINT [ "./start.sh" ]

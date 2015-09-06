FROM kmallea/steamcmd

MAINTAINER Peter <peter@test.com>

# Run commands as the steam user
# USER steam

# Install CS:GO
RUN mkdir /csgo &&\
    cd /steamcmd &&\
    ./steamcmd.sh \
        +login anonymous \
        +force_install_dir /csgo \
        +app_update 740 validate \
        +quit

# Make server port available to host
EXPOSE 27015

# This container will be executable
WORKDIR /csgo
VOLUME /csgo
ENTRYPOINT ["./srcds_run"]

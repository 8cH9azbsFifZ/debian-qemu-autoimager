#!/bin/bash
export DISPLAY=:1.0

# Install reverse beacon aggregator
mkdir /opt/rbn-aggregator/
cd /opt/rbn-aggregator/
URL=https://cms.reversebeacon.net/sites/cms.reversebeacon.net/files/2023/12/05/Aggregator%20v6.5.zip
wget --inet4-only ${URL}
unzip *.zip

# Running the aggregator
AGGREGATOR_INI=/opt/rbn-aggregator/Aggregator.ini
wine "/opt/rbn-aggregator/Aggregator v6.5.exe"

# Install skimmer server
mkdir /opt/skimmer-server/
cd /opt/skimmer-server/
URL=https://www.dxatlas.com/SkimServer/Files/SkimSrv.zip
wget --inet4-only ${URL}
unzip *.zip
innoextract *.exe

# Running the skimmer server
wine /opt/skimmer-server/app/SkimSrv.exe


# Install cw skimmer
mkdir /opt/cwskimmer/
cd /opt/cwskimmer/
URL=https://www.dxatlas.com/CwSkimmer/Files/CwSkimmer.zip
wget --inet4-only ${URL}
unzip *.zip
innoextract *.exe


# Install hermes dll
mkdir /opt/hermes-dll/
cd /opt/hermes-dll/
URL=https://github.com/k3it/HermesIntf/releases/download/v24.1.13/HermesIntf-24.1.13.zip
wget --inet4-only ${URL}
unzip *.zip




# TODO from here: running it
https://github.com/8cH9azbsFifZ/docker-cwskimmer/blob/main/Dockerfile

# Configuration stuff
ENV PATH_INI_SKIMSRV "/root/prefix32/drive_c/users/root/Application Data/Afreet/Products/SkimSrv/SkimSrv.ini"
ENV PATH_INI_AGGREGATOR "/rbnaggregator_${V_RBNAGGREGATOR}/Aggregator.ini"
RUN mkdir -p $(dirname ${PATH_INI_SKIMSRV})
COPY ./config/rbn/Aggregator.ini ${PATH_INI_AGGREGATOR}
COPY ./config/skimsrv/SkimSrv.ini ${PATH_INI_SKIMSRV}
RUN cp /HermesDLL_${V_HERMES}/HermesIntf.dll /skimmersrv_${V_SKIMMERSRV}/app/
RUN rm /skimmersrv_${V_SKIMMERSRV}/app/Qs1rIntf.dll
COPY ./install/patt3ch/patt3ch.lst /skimmersrv_${V_SKIMMERSRV}/userappdata/Afreet/Reference/Patt3Ch.lst

ENV LOGFILE_HERMES /root/HermesIntf_log_file.txt
ENV LOGIFLE_AGGREGATOR /root/AggregatorLog.txt

## Configuration
ENV QTH KA12aa
ENV NAME "Mr. X"
ENV SQUARE KA12aa
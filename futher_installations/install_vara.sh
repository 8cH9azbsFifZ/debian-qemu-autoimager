#!/bin/bash
# VARA HF

# Installation only with X running
export DISPLAY=:1.0
winetricks win7
winetricks sound=alsa
#winetricks -q dotnet35sp1 # ref: https://docs.google.com/document/d/1wkOhtTtpdvjFjBVm9xAMRV-pWem64HQRMoRm91mwGDw/edit
winetricks -q dotnet40
winetricks vb6run
winetricks vcrun2015
winetricks -q pdh
winetricks -q dotnet472

# WA: https://github.com/Winetricks/winetricks/issues/1579
mkdir /opt/pdh
cd /opt/pdh
URL=http://download.microsoft.com/download/winntsrv40/update/5.0.2195.2668/nt4/en-us/nt4pdhdll.exe 
wget --inet4-only ${URL}
unzip nt4pdhdll.exe 
cp pdh.dll ~/.wine/drive_c/windows/system32


# Install VARA HF
mkdir /opt/vara-hf/
cd /opt/vara-hf/
URL="https://downloads.winlink.org/VARA%20Products/VARA%20HF%20%20v4.8.3%20%20setup.zip"
wget --inet4-only ${URL}
unzip *.zip
#innoextract *.exe
wine 'VARA setup (Run as Administrator).exe'



# Install VARA FM
mkdir /opt/vara-fm/
cd /opt/vara-fm/
URL="https://downloads.winlink.org/VARA%20Products/VARA%20FM%20v4.3.3%20%20setup.zip"
wget --inet4-only ${URL}
unzip *.zip
#innoextract *.exe
wine 'VARA FM setup (Run as Administrator).exe'


# Install varanny
#apt-get -y install golang
mkdir /opt/varanny
cd /opt/varanny
URL=https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
wget --inet4-only ${URL}
tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
git clone https://github.com/islandmagic/varanny.git
cd varanny
#CGO_ENABLED=1 go build
go mod tidy
go build

# Running VARANNY
CONFIG=/opt/varanny/varanny.json
# REF: https://github.com/islandmagic/varanny?tab=readme-ov-file



# Running VARA HF
wine "/root/.wine/drive_c/VARA/VARA.exe"


# Running VARA FM
wine "/root/.wine/drive_c/VARA FM/VARAFM.exe"




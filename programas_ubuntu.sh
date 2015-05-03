#!/bin/bash
clear
echo "------------- Flávio Oliveira ----- oliveiradeflavio@gmail.com ----"
echo "Libreoffice, Codecs, Java 8, Flash, Som e Vídeo, Ubuntu-Tweak, GIMP, Wine, SimpleScreenRecorder ...etc"
echo "-------------------------------------------------------------------"
sleep 5
clear

echo "Adicionando PPA's"
echo ""
sudo add-apt-repository ppa:libreoffice/ppa -y ; sudo add-apt-repository ppa:mc3man/trusty-media -y ; sudo add-apt-repository ppa:ffmulticonverter/stable -y ; sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y ; sudo add-apt-repository ppa:webupd8team/java -y ; sudo add-apt-repository ppa:tualatrix/ppa -y ; sudo add-apt-repository ppa:videolan/stable-daily -y ; sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y ; sudo add-apt-repository ppa:ubuntu-wine/ppa -y

sleep 3
clear
echo "Atualizando a lista de programas"
echo ""
sudo apt-get update ; sudo apt-get dist-upgrade -y

sleep 3
clear
echo "Instalando os programas"
echo ""
sudo apt-get install libreoffice -y ; sudo apt-get install oracle-java8-installer -y ; echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections ; sudo apt-get install ffmulticonverter -y ; sudo apt-get install simplescreenrecorder -y ; sudo apt-get install simplescreenrecorder-lib:i386 -y ; sudo apt-get install ubuntu-tweak -y ; sudo apt-get install vlc -y ; sudo apt-get install audacious -y ; sudo apt-get install bleachbit -y ; sudo apt-get install gimp -y ; sudo apt-get install wine1.7 -y

sleep 3
clear
echo "Instalando Codecs de Terceiros"
echo ""
sudo apt-get install ubuntu-restricted-extras faac faad ffmpeg gstreamer0.10-ffmpeg flac icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj p7zip p7zip-full p7zip-rar rar unrar unace-nonfree sharutils uudeview mpack cabextract libdvdread4 libav-tools libavcodec-extra-54 libavformat-extra-54  -y
echo ""
#script que faz a instalação da libdvdread4 "para reprodução de DVD encriptado"
sudo /usr/share/doc/libdvdread4/install-css.sh

sleep 3
clear
echo "--------------------------------------------"
echo "  Instalação Completa. Reinicie o Sistema"
echo "Flávio Oliveira - oliveiradeflavio@gmail.com"
echo "--------------------------------------------"

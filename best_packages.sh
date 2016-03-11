#!/usr/bin/env bash
#2015-2016
#instalação de programas automáticos
#
#por Flávio Oliveira
#https://github.com/oliveiradeflavio
#http://youtube.com/flaviodicas
#http://flaviodeoliveira.com.br
#oliveiradeflavio@gmail.com

if [[ `id -u` -ne 0 ]]; then
	echo
	zenity --info --text="Você precisa ter poderes administrativos (root)

	Execute pelo Terminal:
	sudo ./best_packages.sh" && echo $?
	if [ $? -eq 1 ]; then
			exit 1
	fi
	exit 0
fi
		exit
fi

testaconexao()
{
echo "Aguarde!!! Verificando conexão com a internet"
if ! ping -c 7 www.google.com.br 1>/dev/null 2>/dev/stdout; then
	echo "Alguns módulos desse script precisa de conexão com a internet para serem executado"
	sleep 3
	read -p "Deseja refazer o teste de conexão? s/n: " -n1 escolha
	case $escolha in
			s|S) echo
				clear
				testaconexao
				;;
			n|N) echo
				echo Voltando ao Menu Principal ...
				sleep 2
				menu
				exit
				;;
			*) echo
				echo Alternativas incorretas ... Saindo!!!!
				exit
				;;
	esac
else
	echo "Teste de conexão está ok"
	sleep 1

fi
}

#ppa's e programas compatíveis para a versão 14.04 do Ubuntu e LinuxMint >= 17.0
ubuntu1404()
{
clear
DIR=/etc/apt/sources.list.d/

	echo "Verificando e Adicionando os PPA's para instalação"
	echo
if [ -e "$DIR libreoffice-ppa-trusty.list" ]; then
	echo "Sistema já contém o PPA LIBREOFFICE"
	sleep 1
else
	add-apt-repository ppa:libreoffice/ppa -y
fi

if [ -e "$DIR google-chrome.list" ]; then
	echo "Sistema já contém o PPA Chrome"
	sleep 1
else
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
fi

if [ -e "$DIR mc3man-trusty-media-trusty.list" ]; then
	echo "Sistema já contém o PPA MC3MAN(CODECS)"
	sleep 1
else
	add-apt-repository ppa:mc3man/trusty-media -y
fi

if [ -e "$DIR ffmulticonverter-stable-trusty.list" ]; then
	echo "Sistema já contém o PPA FFMULTICONVERTER"
	sleep 1
else
	add-apt-repository ppa:ffmulticonverter/stable -y
fi

if [ -e "$DIR maarten-baert-simplescreenrecorder-trusty.list" ]; then
	echo "Sistema já contém o PPA SIMPLESCREENRECORDER"
	sleep 1
else
	add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
fi

if [ -e "$DIR webupd8team-java-trusty.list" ]; then
	echo "Sistema já contém o PPA JAVA (WEB/JDK)"
	sleep 1
else
	add-apt-repository ppa:webupd8team/java -y
fi

if [ -e "$DIR tualatrix-ppa-trusty.list" ]; then
	echo "Sistema já contém o PPA UBUNTU TWEAK"
	sleep 1
else
	add-apt-repository ppa:tualatrix/ppa -y
fi

if [ -e "$DIR otto-kesselgulasch-gimp-trusty.list" ]; then
	echo "Sistema já contém o PPA GIMP"
	sleep 1
else
	add-apt-repository ppa:otto-kesselgulasch/gimp -y
fi

if [ -e "$DIR ubuntu-wine-ppa-trusty.list" ]; then
	echo "Sistema já contém o PPA WINE"
	sleep 1
else
	add-apt-repository ppa:ubuntu-wine/ppa -y
fi
	echo
clear
	echo "PPA's adicionados"
	sleep 5
clear
	echo "Atualizando a Lista de Programas (/etc/apt/sources.list)"
	echo "Atualizando Programas para versão mais recente"
apt-get update ; apt-get dist-upgrade -y
clear
	sleep 5
	echo "Instalando Programas ..."
apt-get install libreoffice google-chrome-stable ffmulticonverter simplescreenrecorder simplescreenrecorder-lib:i386 ubuntu-tweak vlc audacious bleachbit gimp wine1.7 -y --force-yes && oracle-java8-installer -y ; echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
	echo
clear
	sleep 2
	echo "Checando Novas Atualizações"
apt-get update ; apt-get dist-upgrade -y
	echo
clear
	sleep 2
	echo "Instalando Pacote de Multimedia (Codecs)"
apt-get install ubuntu-restricted-extras faac faad ffmpeg gstreamer0.10-ffmpeg flac icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj p7zip p7zip-full p7zip-rar rar unrar unace-nonfree sharutils uudeview mpack cabextract libdvdread4 libav-tools libavcodec-extra-54 libavformat-extra-54 easytag gnome-icon-theme-full gxine id3tool libmozjs185-1.0 libopusfile0 libxine1 libxine1-bin libxine1-ffmpeg libxine1-misc-plugins libxine1-plugins libxine1-x nautilus-script-audio-convert nautilus-scripts-manager tagtool -y --force-yes
	echo
/usr/share/doc/libdvdread4/install-css.sh
	echo
clear
	sleep 3
	echo "Instalação Terminada"
	echo "Recomendável que você reinicie seu sistema"
	echo
	echo
	echo "M) Voltar para Menu Principal"
	echo "S) Sair do Terminal"
	echo "R) Reiniciar o sistema"

	read -n1 -p "Escolha as alternativas acima" escolha
		case $escolha in
			M|m) echo
				menu
				;;
			S|s) echo
				exit
				;;
			R|r) echo
				reboot
				;;
			*) echo
				echo Alternativa incorreta
				;;
		esac
}

#ppa's e programas compatíveis com o Ubuntu 15.10
ubuntu1510()
{
clear
DIR=/etc/apt/sources.list.d/

	echo "Adicionando os PPA's para instalação"
	echo
if [ -e "$DIR libreoffice-ubuntu-ppa-wily.list" ]; then
	echo "Sistema já contém o PPA LIBREOFFICE"
	sleep 1
else
	add-apt-repository ppa:libreoffice/ppa -y
fi

if [ -e "$DIR google-chrome.list" ]; then
	echo "Sistema já contém o PPA Chrome"
	sleep 1
else
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
fi

if [ -e "$DIR maarten-baert-ubuntu-simplescreenrecorder-wily.list" ]; then
	echo "Sistema já contém o PPA SIMPLESCREENRECORDER"
	sleep 1
else
	add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
fi

if [ -e "$DIR webupd8team-ubuntu-java-wily.list" ]; then
	echo "Sistema já contém o PPA JAVA (WEB E JDK)"
	sleep 1
else
	add-apt-repository ppa:webupd8team/java -y
fi

if [ -e "$DIR otto-kesselgulasch-ubuntu-gimp-wily.list" ]; then
	echo "Sistema já contém o PPA GIMP"
	sleep 1
else
	add-apt-repository ppa:otto-kesselgulasch/gimp -y
fi

if [ -e "$DIR ubuntu-wine-ubuntu-ppa-wily.list" ]; then
	echo "Sistema já contém o PPA WINE"
	sleep 1
else
	add-apt-repository ppa:ubuntu-wine/ppa -y
fi

	echo
clear
	echo "PPA's adicionados"
	sleep 5
clear
	echo "Atualizando a Lista de Programas (/etc/apt/sources.list)"
	echo "Atualizando Programas para versão mais recente"
apt-get update ; apt-get dist-upgrade -y
clear
	sleep 2
	echo "Instalando Programas ..."
apt-get install libreoffice google-chrome-stable unity-tweak-tool simplescreenrecorder simplescreenrecorder-lib:i386 vlc audacious bleachbit gimp wine1.6 -y --force-yes && oracle-java8-installer -y ; echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
	echo
clear
	sleep 2
	echo "Checando Novas Atualizações"
apt-get update ; apt-get dist-upgrade -y
	echo
clear
	sleep 2
	echo "Instalando Pacote de Multimedia (Codecs)"
apt-get install ubuntu-restricted-extras faac faad ffmpeg flac icedax id3v2 lame libjpeg-progs mjpegtools mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj p7zip p7zip-full p7zip-rar rar unrar unace-nonfree sharutils uudeview mpack cabextract libdvdread4 libav-tools easytag gnome-icon-theme-full gxine id3tool libmozjs185-1.0 libopusfile0 nautilus-script-audio-convert nautilus-scripts-manager tagtool browser-plugin-vlc quicktime-utils -y --force-yes
	echo
/usr/share/doc/libdvdread4/install-css.sh
	echo
clear
	sleep 3
	echo "Instalação Terminada"
	echo "Recomendável que você reinicie seu sistema"
	echo
	echo
	echo "M) Voltar para Menu Principal"
	echo "S) Sair do Terminal"
	echo "R) Reiniciar o sistema"

	read -n1 -p "Escolha as altenativas acima" escolha
		case $escolha in
			M|m) echo
				menu
				;;
			S|s) echo
				exit
				;;
			R|r) echo
				reboot
				;;
			*) echo
				echo Alternativa incorreta
				;;
		esac
}

progr_extra()
{
clear
echo
	echo -e "\033[04;32mProgramas que serão instalados\033[0m"
	echo -e "Virtualbox\nVirtualbox Extension Pack\nSpotify\nHandbrake\nQBittorrent\nKdenlive\nAnki\nAudacity"

	read -n1 -p "Deseja continuar com a instalação? s/n" -s escolha
		if [[ $escolha == 's' ]]; then

cd /tmp/
echo
testaconexao
clear
echo
echo "Virtualbox (programa para virtualização de sistemas)"
echo ; sleep 2
if which -a virtualbox 1>/dev/null 2>/dev/stdout; then
		echo "Você já possui o programa" ; sleep 2
else
	if uname -m | grep '64' ; then
		echo "Baixando o Virtualbox 64bits e a extensão para USB"
		echo
		wget -b http://download.virtualbox.org/virtualbox/5.0.16/VirtualBox-5.0.16-105871-Linux_amd64.run -O virtualbox64.run &&
PID=$(pidof wget) && tail -f wget-log --pid=$PID ; rm wget-log ; sleep 2
		wget -b http://download.virtualbox.org/virtualbox/5.0.16/Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack	 &&
PID=$(pidof wget) && tail -f wget-log --pid=$PID ; rm wget-log ; sleep 2
		clear
		echo "Instalando ..."
		sleep 2
		chmod +x virtualbox64.run ; ./virtualbox64.run
		sleep 3
		vboxmanage extpack install ./Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
	else
		echo "Baixando o Virtualbox 32bits e a extensão para USB"
		echo
		wget -b http://download.virtualbox.org/virtualbox/5.0.16/VirtualBox-5.0.16-105871-Linux_x86.run -O virtualbox32.run &&
PID=$(pidof wget) && tail -f wget-log --pid=$PID ; rm wget-log ; sleep 2
		wget -b http://download.virtualbox.org/virtualbox/5.0.16/Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack &&
PID=$(pidof wget) && tail -f wget-log --pid=$PID ; rm wget-log ; sleep 2
		clear
		echo "Instalando ..."
		sleep 2
		chmod +x virtualbox32.run ; ./virtualbox32.run
		sleep 3
		vboxmanage extpack install ./Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
	fi
fi
sleep 3
clear
echo
echo "Spotify (serviço de música comercial em streaming)"
echo ; sleep 2
if which -a spotify 1>/dev/null 2>/dev/stdout; then
	echo "Você já possui o programa" ; sleep 2
else
	echo "Adicionando o Repositório do Spotify"
	sleep 2
	sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list"
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 1>/dev/null 2>/dev/stdout
	echo "Aguarde, atualizando a sources.list"
	apt-get update 1>/dev/nul 2>/dev/stdout
	echo "Instalando Spotify"
	sleep 2;
	apt-get install spotify-client -y --force-yes
fi
sleep 3
clear
echo
echo "Handbrake (programa para converter vídeos)"
echo ; sleep 2
	if which -a handbrake 1>/dev/null 2>/dev/stdout; then
		echo "Você já possui o programa"
	else
		echo "Instalando ..."
		apt-get install handbrake -y
	fi
sleep 3
clear
echo
echo "QBittorrent (programa para baixar arquivos torrent)"
echo ; sleep 2
	if which -a qbittorrent 1>/dev/null 2>/dev/stdout; then
		echo "Você já possui o programa"
	else
		echo "Instalando ..."
		apt-get install qbittorrent -y
	fi
sleep 3
clear
echo
echo "Kdenlive (poderoso editor de vídeos)"
echo ; sleep 2
	if which -a kdenlive 1>/dev/null 2>/dev/stdout; then
		echo "Você já possui o programa"
	else
		echo "Instalando ..."
		apt-add-repository ppa:sunab/kdenlive-svn -y
		apt-get update 1>/dev/null 2>/dev/stdout
		apt-get install kdenlive kde-workspace-data kde-runtime -y
	fi
sleep 3
clear
echo
echo "Anki (programa extensível de aprendizado com cartões de memória)"
echo ; sleep 2
	if which -a anki 1>/dev/null 2>/dev/stdout; then
		echo "Você já possui o programa"
	else
		echo "Instalando ..."
		apt-get install anki -y
	fi
sleep 3
clear
echo
echo "Audacity (rápido editor de áudio multiplataforma)"
echo ; sleep 2
	if which -a audacity 1>/dev/null 2>/dev/stdout1>/dev/null 2>/dev/stdout; then
		echo "Você já possui o programa"
	else
		echo "Instalando ..."
		apt-get install audacity -y
	fi
elif [[ $escolha == 'n' ]]; then
	echo
	echo "Voltando ao Menu Principal"
	sleep 2 ; menu
elif [[ $escolha != 's' ]] && [[ $escolha != 'n' ]]; then
	echo
	echo "Alternativas incorretas"
	sleep 2 ; progr_extra
else
	echo "Finalizando script"
	sleep 2 ; exit
fi
echo
echo "Instalação Concluída"
sleep 3
echo
	echo "m) Voltar ao Menu Principal"
	echo "s) Sair do script"
	echo
	read -p "Escolha uma das opções. " -n1 -s escolha
	case $escolha in
		m|M) echo
			menu
			;;
		s|S) echo
			exit
			;;
		*) echo
			echo Alternativa Incorreta. Voltando ao Menu Principal
			sleep 1
			menu
			;;
	esac
}

#faz a verificação de qual distribuição está em execução
verifica()
{
clear
verificadistro=$(cat /etc/lsb-release | grep "DISTRIB_ID")
verificaversao=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")

if [[ $verificadistro == "DISTRIB_ID=Ubuntu" ]] && [[ $verificaversao == "DISTRIB_RELEASE=14.04" ]]; then
	echo
	echo "Distribuição Ubuntu 14.04 Trusty Tahr"
	echo
	echo -e "\033[04;32mProgramas que serão instalados\033[0m"
	echo -e "Libreoffice (Versão mais nova)\nGoogle Chrome\nJava (Web/JDK)\nFF Multi Converter\nSimple Screen Recorder\nUbuntu-Tweak\nVLC Player\nAudacious Player\nBleachbit\nGimp\nwine1.7\nCodecs (muito codecs =D)\n"
	echo
	sleep 3

	read -n1 -p "Deseja continuar com a instalação? s/n" -s escolha
		case $escolha in
			S|s) echo
				testaconexao
				ubuntu1404
				;;
			N|n) echo
				echo Finalizando script
				exit
				;;
			*) echo
				echo Alternativas incorretas!!!
				sleep 1 ; clear
				verifica
				;;
		esac
elif [[ $verificadistro == "DISTRIB_ID=LinuxMint" ]] && [[ "$verificaversao" == "DISTRIB_RELEASE=17.3" ]]; then
	echo
	echo "Distribuição Linux Mint 17.3 Rosa"
	echo
	echo -e "\033[04;32mProgramas que serão instalados\033[0m"
	echo -e "Libreoffice (Versão mais nova)\nGoogle Chrome\nJava (Web/JDK)\nFF Multi Converter\nSimple Screen Recorder\nUbuntu-Tweak\nVLC Player\nAudacious Player\nBleachbit\nGimp\nwine1.7\nCodecs (muito codecs =D)\n"
	echo
	sleep 3

	read -n1 -p "Deseja continuar com a instalação? s/n" -s escolha
		case $escolha in
			S|s) echo
				testaconexao
				ubuntu1404
				;;
			N|n) echo
				echo Finalizando script
				exit
				;;
			*) echo
				echo Alternativas incorretas!!!
				sleep 1 ; clear
				verifica
				;;
		esac
elif [[ $verificadistro == "DISTRIB_ID=Ubuntu" ]] && [[ $verificaversao == "DISTRIB_RELEASE=15.10" ]]; then
	echo
	echo "Distribuição Ubuntu 15.10 Wily Werewolf"
	echo
	echo -e "\033[04;32mProgramas que serão instalados\033[0m"
	echo -e "Libreoffice (Versão mais nova)\nGoogle Chrome\nUnity Tweak Tool\nJava (Web/JDK)\nSimple Screen Recorder\nVLC Player\nAudacious Player\nBleachbit\nGimp\nwine1.6\nCodecs (muito codecs =D)\n"
	echo
	sleep 3

	read -n1 -p "Deseja continuar com a instalação? s/n" -s escolha
		case $escolha in
			S|s) echo
				testaconexao
				ubuntu1510
				;;
			N|n) echo
				echo Finalizando script
				exit
				;;
			*) echo
				echo Alternativas incorretas!!!
				sleep 1 ; clear
				verifica
				;;
		esac
else
	echo -e "\033[01;31mDistribuição incompativel\033[0m"
	sleep 2
	read -p "Deseja voltar ao Menu Principal? s/n" -n1 -s escolha
		case $escolha in
			S|s) echo
				menu
				;;
			N|n) echo
				echo Saindo ...
				exit
				;;
			*) echo
				echo Alternativa incorretas. Fechando script ...
				sleep 2
				exit
				;;
		esac
	exit
fi
}

limpeza()
{
clear
if which -a prelink && which -a deborphan; then
	clear
	echo "Esvaziando a Lixeira"
	rm -rf /home/$SUDO_USER/.local/share/Trash/files/*
	echo "--------------------------------------------"
	echo "Esvaziando os Arquivos Temporários (pasta tmp)"
	rm -rf /var/tmp/*
	echo "--------------------------------------------"
	echo "Excluindo Arquivos Inúteis do Cache do Gerenciador de Pacotes (apt)"
	apt-get clean -y
	echo "--------------------------------------------"
	echo "Excluindo Pacotes Velhos que não tem utilidade para o Sistema"
	apt-get autoremove -y
	echo "--------------------------------------------"
	echo "Excluindo Pacotes Duplicados"
	apt-get autoclean -y
	echo "--------------------------------------------"
	echo "Reparando Pacotes com Problemas"
	dpkg --configure -a
	echo "--------------------------------------------"
	echo "Removendo Pacotes Órfãos"
	apt-get remove $(deborphan) -y ; apt-get autoremove -y
	echo "--------------------------------------------"
	echo "Removendo Arquivos (.bak, ~, .tmp) da pasta Home"
	for i in *~ *.bak *.tmp; do
		find $HOME -iname "$i" -exec rm -f {} \;
	done
	echo "--------------------------------------------"
	echo "Atualizando as Entradas do GRUB"
	update-grub
	echo "--------------------------------------------"
	echo "Otimizando as Bibliotecas dos Programas"
	/etc/cron.daily/prelink
	echo "--------------------------------------------"
	clear
	echo "Limpeza Concluída ... "
	sleep 3
else
	clear
	echo -e "Você precisa instalar dois programas\n para continuar com a Limpeza."
	read -p "Deseja instalar o Prelink e o Deborphan? s/n: " -n1 escolha
	case $escolha in
		s|S) echo
			testaconexao
			apt-get install prelink deborphan -y ; sed -i 's/unknown/yes/g' /etc/default/prelink
			limpeza
			;;
		n|N) echo
			echo Voltando para o Menu Principal ...
			sleep 1
			menu
			;;
		*) echo
			echo Alternativas incorretas ... Voltando ao Menu Principal!!!
			sleep 1
			menu
			;;
	esac

fi
echo
	echo "m) Voltar ao Menu Principal"
	echo "s) Sair do script"
	echo
	read -p "Escolha uma das opções. " -n1 -s escolha
	case $escolha in
		m|M) echo
			menu
			;;
		s|S) echo
			exit
			;;
		*) echo
			echo Alternativa Incorreta. Voltando ao Menu Principal
			sleep 1
			menu
			;;
	esac

}

otimizasistema()
{
clear
echo
memfree=$(grep "memfree = 50" /etc/preload.conf)
memcached=$(grep "memcached = 0" /etc/preload.conf)
processes=$(grep "processes = 30" /etc/preload.conf)
prelink=$(grep "PRELINKING=unknown" /etc/default/prelink)

echo "Verificando Sistema ... "
if which -a prelink 1>/dev/null 2>/dev/stdout && which -a preload 1>/dev/null 2>/dev/stdout; then
		echo
		echo "Configurando o PRELOAD"
		if [[ $memfree == "memfree = 90" ]];then
			echo "configurando..."
			sed -i 's/memfree = 50/memfree = 90/g' /etc/preload.conf

		elif [[ $memcached == "memcached = 35" ]]; then
			echo "configurando..."
			sed -i 's/memcached = 0/memcached = 35/g' /etc/preload.conf

		elif [[ $processes == "processes = 50" ]]; then
			echo "configurando..."
			sed -i 's/processes = 30/processes = 50/g' /etc/preload.conf

		else
			echo "Não há nada para ser configurado"
			echo "Isso porque já foi configurado anteriomente"
		fi
		echo
		echo "Ativando o PRELINK"
		if [[ $prelink == "PRELINKING=unknown" ]]; then
			echo "adicionando ..."
			sed -i 's/unknown/yes/g' /etc/default/prelink

		else
			echo "Otimização já adicionada anteriormente."

		fi
	else
		clear
		echo -e "Você precisa instalar dois programas\n para continuar com a otimização."
		read -p "Deseja instalar o Prelink e o Preload? s/n: " -n1 escolha
			case $escolha in
				s|S) echo
				     	apt-get install prelink preload -y 1>/dev/null 2>/dev/stdout
				     	;;
				n|N) echo
				     	echo Voltando ao Menu Principal. Nada a ser feito
					sleep 2
					exit
					;;
				*) echo
					echo Alternativas incorretas!
					sleep 2
					optimize
					;;
			esac
	fi
	echo
	echo "Otimização Concluída"
	sleep 1
echo
	echo "m) Voltar ao Menu Principal"
	echo "s) Sair do script"
	echo
	read -p "Escolha uma das opções. " -n1 -s escolha
	case $escolha in
		m|M) echo
			menu
			;;
		s|S) echo
			exit
			;;
		*) echo
			echo Alternativa Incorreta. Voltando ao Menu Principal
			sleep 1
			menu
			;;
	esac

}

sobre()
{
clear
	echo "O script surgiu nas minhas formatações e instalações do sistema Ubuntu e derivados. Para agilizar todo o processo de instalação de PPA's e programas padrões para usuários iniciantes. Foi daí que surgiu a idéia do script. Alguns programas foram sugestões de usuários e inscritos do meu canal no Youtube. Agradeço e eles por deixar um tempo para contribuir com esse script... Agradeço também a minha companheira Talita por colaborar também com esse script =D"
	echo
	echo "Caso você queira deixar alguma modificação, envie para o seguinte email:"
	echo "email: oliveiradeflavio@gmail.com"
	echo
	echo -e "Quer conhecer um pouco mais sobre meus projetos? Acesse os link's abaixo =D\nValeu e Obrigado\n"
	echo -e "http://youtube.com/flaviodicas\nhttp://www.flaviodeoliveira.com.br\nhttps://github.com/oliveiradeflavio"
	echo
	echo "Flávio Oliveira"
	echo "data: 10/11/2015"
	echo
	echo "m) Menu Principal"
	echo "s) Sair"
	echo
read -n1 -p "Escolha as opções acima. m/s" -s escolha
	case $escolha in
		m|M) echo
			menu
			;;
		S|s) echo
			exit
			;;
		*) echo
			echo Alternativa incorreta. Voltando ao Menu Principal!!!
			menu
			;;
	esac
}

menu()
{
clear
	echo -e "\033[01;31mSEJA BEM VINDO ...\033[0m\n\nMENU PRINCIPAL"
	echo
	echo "i) Adicionar PPA e Instalar os Programas"
	echo
	echo "e) Instalar programas extras (contribuições de usuários)"
	echo
	echo "l) Excluir Arquivos que não estão sendo utilizados (limpeza)"
	echo
	echo "o) Otimização do Sistema (SWAP, Prelink e Preload)"
	echo
	echo "c) Conhecer o desenvolvedor e o propósito desse script"
	echo
	echo "s) Sair"
	echo
	read -p "Selecione o que deseja ser feito: " -n1 -s escolha
case $escolha in
	i|I) echo
		verifica
		;;
	e|E) echo
		progr_extra
		;;
	l|L) echo
		limpeza
		;;
	o|O) echo
		otimizasistema
		;;
	c|C) echo
		sobre
		;;
	s|S) echo
		echo Saindo ...
		sleep 1
		exit
		;;
	*) echo
		echo Alternativas incorretas
		sleep 1
		menu
		;;
esac
}
menu

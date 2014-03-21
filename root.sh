echo "root de la tablette Nexus 7"

echo " activez le debug ADB avant"
echo "Voulez-vous rooter la tablette ? O/N"
read p
if [ "$p" = "O" ];then
	echo "---------------------------------------------------------------"
	echo "passage en mode Bootloader"
	./adb reboot bootloader
	echo "---------------------------------------------------------------"
	echo "la tablette est elle en mode bootloader ? si oui, on debloque la fonction O/N"
	read boot
	if [ "$boot" = "O" ];then
		echo "---------------------------------------------------------------"
		echo "A l'aide des touches de volume de la tablette, selectionnez YES, puis pour confirmer appuyez sur le bouton POWER"
		sudo ./fastboot oem unlock
		echo "---------------------------------------------------------------"
		echo "une fois l'opération effectuée, on va flasher"
		echo "voyez-vous la ligne '(bootloader) Unlocking bootloader done!' O/N ?"
		read boot_stage1
		if [ "$boot_stage1" = "O" ];then	
		echo "---------------------------------------------------------------"	
		echo "ok, le bootloader est débloqué, on va flasher"
		sudo ./fastboot flash recovery openrecovery-twrp-2.7.0.0-flo.img
		echo "---------------------------------------------------------------"
		echo "a l'aide des touches volume, selectionnez 'Recovery Mode', puis appuyez sur POWER"
		echo "appuyez sur reboot, puis recovery, ici il vous demande de rooter la tablette, glissez votre doigt sur la zone bleue"
		echo "la tablette doit redemarrer en mode recovery, maintenant appuyez sur 'reboot'"
		echo " puis bootloader, mainteant vous voyez un Android ? est elle prete ? on termine le root ? O/N"
		read boot_stage2
			if [ "$boot_stage1" = "O" ];then	
			  sudo ./fastboot boot CF-Auto-Root-flo-razor-nexus7.img
			  echo "---------------------------------------------------------------"
			fi
		
		fi
	else
		exit 0
	fi
else
	exit 0
fi


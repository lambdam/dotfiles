-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

local awesome = awesome

Debian_menu = {}

Debian_menu["Debian_Aide"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"Xman","xman"},
}
Debian_menu["Debian_Applications_Accessibilité"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Dessin_et_image"] = {
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Applications_Éditeurs"] = {
	{"Xedit","xedit"},
}
Debian_menu["Debian_Applications_Gestion_de_fichiers"] = {
	{"Nemo","/usr/bin/nemo",},
}
Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh"},
}
Debian_menu["Debian_Applications_Lecteurs"] = {
	{"Pix Image Viewer","/usr/bin/pix","/usr/share/pixmaps/pix.xpm"},
	{"Xditview","xditview"},
	{"Xviewer","/usr/bin/xviewer","/usr/share/pixmaps/gnome-xviewer.xpm"},
}
Debian_menu["Debian_Applications_Programmation"] = {
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
}
Debian_menu["Debian_Applications_Réseau_Communication"] = {
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet.netkit"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Applications_Réseau_Transfert_de_fichiers"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Applications_Réseau"] = {
	{ "Communication", Debian_menu["Debian_Applications_Réseau_Communication"] },
	{ "Transfert de fichiers", Debian_menu["Debian_Applications_Réseau_Transfert_de_fichiers"] },
}
Debian_menu["Debian_Applications_Sciences_Mathématiques"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Sciences"] = {
	{ "Mathématiques", Debian_menu["Debian_Applications_Sciences_Mathématiques"] },
}
Debian_menu["Debian_Applications_Système_Administration"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_Système_Gestionnaires_de_paquets"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","x-terminal-emulator -e synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Applications_Système_Matériel"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_Système_Surveillance"] = {
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Applications_Système"] = {
	{ "Administration", Debian_menu["Debian_Applications_Système_Administration"] },
	{ "Gestionnaires de paquets", Debian_menu["Debian_Applications_Système_Gestionnaires_de_paquets"] },
	{ "Matériel", Debian_menu["Debian_Applications_Système_Matériel"] },
	{ "Surveillance", Debian_menu["Debian_Applications_Système_Surveillance"] },
}
Debian_menu["Debian_Applications_Vidéo"] = {
	{"Xplayer","/usr/bin/xplayer","/usr/share/pixmaps/xplayer.xpm"},
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibilité", Debian_menu["Debian_Applications_Accessibilité"] },
	{ "Dessin et image", Debian_menu["Debian_Applications_Dessin_et_image"] },
	{ "Éditeurs", Debian_menu["Debian_Applications_Éditeurs"] },
	{ "Gestion de fichiers", Debian_menu["Debian_Applications_Gestion_de_fichiers"] },
	{ "Interpréteurs de commandes", Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] },
	{ "Lecteurs", Debian_menu["Debian_Applications_Lecteurs"] },
	{ "Programmation", Debian_menu["Debian_Applications_Programmation"] },
	{ "Réseau", Debian_menu["Debian_Applications_Réseau"] },
	{ "Sciences", Debian_menu["Debian_Applications_Sciences"] },
	{ "Système", Debian_menu["Debian_Applications_Système"] },
	{ "Vidéo", Debian_menu["Debian_Applications_Vidéo"] },
}
Debian_menu["Debian_Gestionnaires_de_fenêtres"] = {
	{"awesome",function () awesome.exec("/usr/bin/awesome") end,"/usr/share/pixmaps/awesome.xpm"},
}
Debian_menu["Debian_Jeux_Jouets"] = {
	{"Oclock","oclock"},
	{"Redshift","redshift-gtk"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Jeux"] = {
	{ "Jouets", Debian_menu["Debian_Jeux_Jouets"] },
}
Debian_menu["Debian"] = {
	{ "Aide", Debian_menu["Debian_Aide"] },
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Gestionnaires de fenêtres", Debian_menu["Debian_Gestionnaires_de_fenêtres"] },
	{ "Jeux", Debian_menu["Debian_Jeux"] },
}

debian = { menu = { Debian_menu = Debian_menu } }
return debian
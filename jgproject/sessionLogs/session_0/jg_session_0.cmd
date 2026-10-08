# ----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2019.12
# platform  : Linux 3.10.0-1160.118.1.el7.x86_64
# version   : 2019.12p002 64 bits
# build date: 2020.02.27 18:30:54 PST
# ----------------------------------------
# started   : 2026-10-01 22:15:18 IST
# hostname  : compute-srv3.eda.atme.in.eda.atme.in
# pid       : 14575
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:41042' '-style' 'windows' '-data' 'AQAAADx/////AAAAAAAAA3oBAAAAEABMAE0AUgBFAE0ATwBWAEUAAAAAAAAB4A==' '-proj' '/home/sgeuser36/Desktop/usb2.0/physical_layer/crc5/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/sgeuser36/Desktop/usb2.0/physical_layer/crc5/jgproject/.tmp/.initCmds.tcl' 'usb2_crc5.tcl'
clear -all
analyze -sv12 -f design.f
elaborate -top crc5_gen
clock -none
reset -none
prove -all
report -results


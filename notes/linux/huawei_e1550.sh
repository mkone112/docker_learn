https://tldp.org/HOWTO/Remote-Serial-Console-HOWTO/modem-minicom.html
отключить инет
apt install -y minicom
sudo minicom -D /dev/ttyUSB0
ctrl-a e  # чтобы был вывод что ввожу
AT^U2DIAG=0
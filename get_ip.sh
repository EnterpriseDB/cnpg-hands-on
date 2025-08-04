#hostname -I | awk '{print $1}'
ifconfig en0 inet | awk '/inet6/ {next} /inet/ {print $2}'

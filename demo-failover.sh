. ./commands.sh

while true; 
do 
	tput clear
	print_info "\n";
	print_info "\n"; 
	print_info "\n"; 
	print_info "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"; 
	print_info " \n"
	print_info "                                                                                                    CLOUDNATIVEPG\n"
	print_info " \n"
	print_info "                                                                                        Killing the primary to illustrate failover\n"; 
	print_info " \n"
	print_info "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"; 
	./15_failover.sh; 
	sleep 60; 
done

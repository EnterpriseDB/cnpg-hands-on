#!/bin/bash

source ./config.sh

print_command "echo \"create table test (id integer, description text);\"\n" 
print_command "echo \"insert into test values (1, 'TEST1');\"\n"
print_command "echo \"select * from test;\"\n"

cat sql/create_data.sql | ${kubectl_cnp} psql  ${cluster_name}

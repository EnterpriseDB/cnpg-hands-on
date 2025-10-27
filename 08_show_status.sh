#!/bin/bash

source ./config.sh

watch -c -n 5 "${kubectl_cnp} --color always status ${cluster_name}"

#!/bin/bash

source ./config.sh

watch -c -n 5 "${kubectl_cnp} status ${cluster_name}"

#!/bin/bash

watch -c -n 2 "${kubectl_cnp} --color always status pg-us"

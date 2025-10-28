#!/bin/bash

kubectl patch cluster pg-us --type merge -p '{"spec":{"replica":{"enabled":false}}}'

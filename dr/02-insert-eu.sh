#!/bin/bash

kubectl cnpg psql pg-eu -- -c "drop table if exists test"
kubectl cnpg psql pg-eu -- -c "create table test (id int)"
kubectl cnpg psql pg-eu -- -c "insert into test values (1)"

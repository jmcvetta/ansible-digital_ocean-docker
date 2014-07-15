#!/usr/bin/env bash

time ansible-playbook provision_do.yml

time ansible-playbook -i dohosts install_docker.yml

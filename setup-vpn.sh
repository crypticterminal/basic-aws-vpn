#!/usr/bin/env bash

CONFIG_ARCHIVE_PATH=config.zip

if [[ ! -z ${CONFIG_ARCHIVE_PATH} ]]; then
    zip -r config config/*
fi

ansible-playbook -i "hosts.ini" --private-key "/path/to/file.pem" vpn-setup.yml 

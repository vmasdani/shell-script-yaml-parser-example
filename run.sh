#!/bin/bash

frontend_template_env="$(cat frontend.template.env)"
config_list="./yq .env.dev config.yml"

$config_list | while read -r line
do
    echo 'key:'
    key=$(echo $line | ./yq 'keys | .[]')
    echo $key
    echo 'value:'
    echo $line | ./yq ".${key}"
    echo
done

echo $frontend_template_env > test
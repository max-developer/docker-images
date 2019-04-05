#!/usr/bin/env bash

filename=$1
config_path=$2
template_name=$3

template_path="/etc/nginx/templates"
template_default="${template_path}/${template_name}.tmpl"

if [[ ! -d "${config_path}" ]]; then
    mkdir ${config_path}
fi

rm ${config_path}/*generated.conf

declare -i iteration

while IFS='= ' read var val
do
    if [[ $var == \[*] ]]
    then
        template=${template_default}
        section=${var//[\[\]]/}
        iteration+=1
    elif [[ $var =~ (template) ]]
    then
        template="${template_path}/${val}.tmpl"
    elif [[ $val ]]
    then
        config_name=$(printf "%s/%03d_%s_generated.conf" ${config_path} ${iteration} ${section})

        if [[ ! -f "$config_name" ]]; then
            cp "${template}" "${config_name}"
        fi

        var=$(echo ${var// /} | tr [a-z] [A-Z]);
        sed -i "s/{{\s*ID\s*}}/${section}/g"  "${config_name}";
        sed -i "s/{{\s*${var}\s*}}/${val}/g" "${config_name}";
    fi

done < ${filename}

for template in $(ls -d ${config_path}/*generated.conf) ; do
    defaults=$(grep -oE '^\{\{[A-Za-z0-9_]+=.+\}\}$' "${template}" | sed -e 's/^{{//' -e 's/}}$//')

    for default in ${defaults}; do

        while IFS="=" read -r var val;
        do
            sed -i "s/{{\s*${var}\s*=.*}}//g" "${template}";
            sed -i "s/{{\s*${var}\s*}}/${val}/g" "${template}";
        done <<< "$default"

    done
done



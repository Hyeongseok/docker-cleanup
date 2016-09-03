#!/bin/bash

# Overridable: base_dir defaults to where the volumes are most likely stored
base_dir=${base_dir:-"/var/lib/docker/volumes"}

for i in $(docker volume ls -q -f dangling=true); do
    echo
    echo "==========================================="
    echo ":: Displaying $i"
    echo "==========================================="
    echo
    tree $base_dir/$i
    echo 
    echo creation: $(stat -c %w $base_dir/$i)
    echo modification: $(stat -c %y $base_dir/$i)
    echo size: $(du -hs $base_dir/$i | awk '{print $1}')
    echo
    confirm=n
    read -p "Delete $i? [y/N]: " confirm
    if [ "$confirm" = "y" -o "$confim" = "Y" ]; then
        echo "Executing: docker volume rm $i"
        docker volume rm "$i"
    fi
done

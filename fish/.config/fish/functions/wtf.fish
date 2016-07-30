function wtf --description "tells me who's spamming my procs, ram or disks"
    echo -n "CPU: "
    ps --no-headers -eo "pid,%cpu,args" --sort -%cpu | head -n 1

    echo -n "RAM: "
    ps --no-headers -eo "pid,%mem,args" --sort -%mem | head -n 1

    if command -s iotop > /dev/null 2>&1
        echo -e "\nDISK:"
        sudo iotop -o -P -b -n 1 | tail -n +3
    end
end

function k40 --description 'Mounts /mnt/cutfiles and runs k40_whisperer'

    if [ (stat -f -L -c %T /mnt/cutfiles) != "nfs" ]
        echo "Mounting /mnt/cutfiles"
        sudo mount -t nfs k40:/mnt/cutfiles /mnt/cutfiles
    else
        echo "/mnt/cutfiles already mounted"
    end

    echo "Run K40-Whisperer"
    ssh -X pi@k40 "cd ~/K40-Whisperer && ./run_k40.sh"
end

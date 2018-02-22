#! /usr/bin/fish

function help_exit
    echo "Usage: managevm.fish <arguments>"
    exit 1
end

set vm_name "ngp-2.1-centos7"
set ip (VBoxManage guestproperty get "$vm_name" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -f2 -d " ")

set cmd $argv[1]
switch "$cmd"
    case --start
        echo "Starting VM"
        VBoxManage startvm "$vm_name" --type headless
    case --poweroff
        echo "Shutting down"
        VBoxManage controlvm "$vm_name" poweroff --type headless
    case --reboot
        echo "Rebooting"
        VBoxManage controlvm "$vm_name" reset --type headless
    case --ssh
        echo "ssh to $ip"
        ssh -X "$ip"
    case --run
        if test (count $argv) -lt 2
            help_exit
        end
        set param $argv[2]
        echo "Running command $param"
        ssh -t -X "$ip" "$param"
    case --getip
        echo "$ip"
    case --mount
        echo "Attempting to mount $ip:/home/danbox/git to /mnt/nfs/ipm"
        sudo mount -t nfs "$ip":/home/danbox/git /mnt/nfs/ipm
        cd /mnt/nfs/ipm/ipm-infr/
    case --kill
        echo "Murdering the VM, RIP"
        VBoxManage unregistervm "$vm_name" --delete
    case \*
        help_exit
end

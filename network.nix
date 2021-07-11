{ config, pkgs, ... }:
let
  share-network = pkgs.writeShellScriptBin "share-network" ''
    #!/bin/bash
    set -e

    # TODO: Fail early if there isn't a working network to share.
    # TODO: Better `to` default.
    from=`ip link show | grep "state UP" | cut -d ':' -f 2 | head -n 1`
    to=`ip link show | grep "state DOWN" | cut -d ':' -f 2 | head -n 1`

    # Parse args.
    while getopts "f:t:" opt; do
        case "$opt" in
            f) from=$OPTARG ;;
            t) to=$OPTARG ;;
        esac
    done

    # Bring up the $to interface.
    sudo ip link set up dev $to
    sudo ip addr flush dev $to
    sudo ip addr add 192.168.0.1/24 dev $to

    sudo sysctl net.ipv4.ip_forward=1 > /dev/null

    # Reset and setup new iptables configuration.
    # TODO: Only revert the needed settings.
    sudo iptables -t filter -F
    sudo iptables -t nat -F
    sudo iptables -X
    sudo iptables -t nat -A POSTROUTING -o $from -j MASQUERADE
    sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    sudo iptables -A FORWARD -i $to -o $from -j ACCEPT

    # Enable DHCP server.
    sudo systemctl start dhcpd4.service

    echo "$from -> $to"
  '';
in {
  home.packages = with pkgs; [
    iptables
    share-network
  ];
}

To use wireless card, update access-points with broadcast ssid and password.

The file is located in /etc/netplan/50-cloud-init.yaml

Here is an example, NETGEAR is the broadcast ssid

    wifis:
        wlan0:
            optional: true
            access-points:
                "NETGEAR":
                    password: "awdawdawd"
            dhcp4: true

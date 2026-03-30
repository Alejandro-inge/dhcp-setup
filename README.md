# dhcp-setup
This repository contains the necessary scripts that enables a DHCP server in Ubuntu server 16 or higher. 

## Considerations

- Local network
- Dynamic IP addresses range
- Delivers my own DNS servers
- Fixed IP addresses

### Architecture

- Ubuntu server v25.10
- Dynamic range: 10.0.4.50 - 10.0.4.200
- Fixed IP addresses: Internal servers
- DHCP IP address 10.0.4.2
- DNS:
    - Local master DNS 10.0.4.2
    - Slave DNS 10.0.4.3

### Involved files

- `/etc/dhcp/dhcpd.conf` - Main configurations file
- `/etc/netstat/interface.yaml` - Static IP address configuration
- `/etc/default/isc-dhcp-server` - Listening interfaces

## Basic steps before proceeding

- Edit the yaml file within `/etc/netplan` to assign a static IP address to your server. In this case 10.0.4.2.

- Define your network, dynamic and static IP addresses.

- Edit the dhcpd.conf file fulfilling your needs.

Then, execute `setup.bash` with sudo

    sudo bash setup.bash

## Validation

When the dhcp serves is fully configured, try to use the command below. Then, connect any device to the network. The dhcp server will offer an IP address to that device.

    tail -f /var/log/syslog

You can see the assigned leases using:

    cat /var/lib/dhcp/dhcpd.leases

If all went smooth, the works is done!

## Notes

- If you have more than one network adapter, you should specify what interface you are using for your DHCP configuration in: `/etc/default/isc-dhcp-server`.

        #Example
        INTERFACES="enp0s3"

- Use google|cloudflare DNSs just in case you do not have your own.

        option domain-name-servers 1.1.1.1, 8.8.8.8, 8.8.4.4;

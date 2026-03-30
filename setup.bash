# Update ubuntu registries

apt update

# Install dhcp

apt install isc-dhcp-server -y

# Copy the custom dhcpd.conf file to /etc/dhcp/

cp ./dhcpd.conf /etc/dhcp/

# Restart dhcp service

systemctl restart isc-dhcp-server

# Show the status

systemctl status isc-dhcp-server
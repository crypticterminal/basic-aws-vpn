# Basic AWS VPN

This is a very basic and barebones toolset to deploy a basic OpenVPN infrastructure to AWS and provision it with a set of pre-existing OpenVPN server credentials.

## Requirements

* AWS account
* EC2 Keypair
* Ansible

## Setup

Replace the placeholders in the file `basic-vpn.cf.template` as follows:

* `<target_zone>`: availability zone you want to deploy your VPN server to (e.g. `us-east-1a`)
* `<target_zone_no_letter_suffix>`: same as `<target_zone>` but without the letter suffix (e.g. if you picked `us-east-1a` then it's `us-east-1`)
* `<keypair>`: name of existing AWS keypair used to access the EC2 via SSH (a requirement to provision it)

Once you've launched the new VPN CloudFormation stack, retrieve the EIP of your new VPN server and add it to the `hosts.ini` template to provision it.

SSH into the server to perform only two changes:
* Turn on IPv4 forwarding (for some reason Ansible fails to do this): `# sysctl -w net.ipv4.ip_forward = 1` and ensure it's active by running `sysctl -p`
* Create a symbolic link to the `python3` executable: `# ln -s /usr/bin/python3 /usr/bin/python` for Ansible to be able to find it.

Provision the box by launching the script `setup-vpn.sh`. A sample client OVPN file is provided too where all you need to do is set the IP of the OVPN server.

# swift-vm
An email server (www.isellemails.com) with little configuration.

You can either choose the VM or the raspberry pi image.

This email server is dovecot, postfix, postfixadmin, roundcubemail, letsencrypt, fail2ban, and rspamd.

Email servers are complicated in the sense that there isn't one executable, but instead, multiple executables. The configuration between the executables takes experience. That's why I'm sharing this.

Swift VM comes preconfigured. It is meant to be easy to install, cloned, and executed on multiple platforms.

Platforms supported:
x86, amd64, x86_64, and raspberry pi

[[Execute all commands as root]]

*Starting with a fresh install of Ubuntu 22.04 or a recent version.
Install the packages using the command:

apt install $(cat ./installed_packages.list)

Copy files from swift-vm directory (etc, home, and var) to your system

Execute the following commands


./cert.sh domain_com

mysql --host=localhost --user=root -p < "SQLDump.sql"

./shell secretpassword02 new_pw domain_com

The production system should be up and running

*Starting with the VM
Execute the following commands


./cert.sh domain_com

./shell secretpassword02 new_pw domain_com

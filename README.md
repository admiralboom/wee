
Repo for a weechat irc server build in the RS cloud

Currently two steps:
a) update build-server to be in the region you want and the domains you want
b) ansible-playbook build-server.yml
c) update sw-install with any changes you need, or customize packages
d) ansible-playbook -i wee_hosts sw-install.yml

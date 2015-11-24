
Repo for a weechat irc server build in the RS cloud
Copy "credentials" to .rackspace_cloud in the directory and populate it with 
your username/apikey/acct

Currently two steps:
<br>
a) update build-server to be in the region you want and the domains you want
<br>
b) ansible-playbook build-server.yml
<br>
c) update sw-install with any changes you need, or customize packages
<br>
d) ansible-playbook -i wee_hosts sw-install.yml

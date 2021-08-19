# NextCloud
Ansible compile and installing NextCloud. Added LDAP bind for global Address Book.

Configuration:
- NextCloud ver. 22.x.x

Installation:
- Installation is done for CentOS 7.x/8.x

Known issue:
- If you want to use SSL/TLS self-signed certificate of you mail server then you will need to place a mail server self-signed certificate to roles/sogo/files/ca-chain.cert.pem and setup the parameter mail_tls to "yes"


#cloud-config
users:
  - name: local_admin
    primary_group: local_admin
    groups: adm, cdrom, sudo, dip, plugdev, lxd
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    lock_passwd: false
    passwd: $6$AufmLu38ohUln1$aqlza1KprG0//qZyXDF4lfyvRHmY8PpJ6u5vGCXmmkMeV2Ko17lmTcsIFPdLnwDkxnfB.KBBhNav1IYU0rvL70

write_files:
- content: |
    apache content file value
  path: /var/www/html/index.html
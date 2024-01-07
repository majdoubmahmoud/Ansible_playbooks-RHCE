# echo "automation ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/automation
# ssh-keygen
# for i in 1 2 3 do; ssh ansible$i; done
#!/bin/bash
ansible all -u root -k -m user -a "name=automation state=present"
ansible all -u root -k -m authorized_key -a "user=automation state=present key='{{ lookup('file', '/home/automation/.ssh/id_rsa.pub') }}'"
ansible all -u root -k -m copy -a "content='automation ALL=(ALL) NOPASSWD: ALL' dest=/etc/sudoers.d/automation"

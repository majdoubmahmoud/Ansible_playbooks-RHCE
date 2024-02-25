# recap conditons:
---
- hosts: all
  tasks:
    - name: Run task only on hosts in the 'web_servers' group
      debug:
        msg: "This task will run only on web servers"
      when: "'web_servers' in group_names"

    - name: Run task only on hosts with CentOS operating system
      debug:
        msg: "This task will run only on CentOS hosts"
      when: ansible_os_family == 'RedHat'

    - name: Run task only on hosts with specific hostname
      debug:
        msg: "This task will run only on hosts with specific hostname"
      when: ansible_hostname == 'specific_hostname'

    - name: Run task only on hosts with specific FQDN
      debug:
        msg: "This task will run only on hosts with specific FQDN"
      when: ansible_fqdn == 'specific_fqdn.example.com'

    - name: Run task only on hosts with specific node name
      debug:
        msg: "This task will run only on hosts with specific node name"
      when: ansible_nodename == 'specific_nodename'

    - name: Run task only on hosts in the 'debian_servers' group
      debug:
        msg: "This task will run only on Debian servers"
      when: "'debian_servers' in group_names"

    - name: Run task only on hosts with specific variable value
      debug:
        msg: "This task will run only on hosts with 'my_variable' set to 'value'"
      when: hostvars[inventory_hostname]['my_variable'] == 'value'

    - name: Run task only on hosts without a specific variable
      debug:
        msg: "This task will run only on hosts without 'my_variable'"
      when: 'my_variable' not in hostvars[inventory_hostname]

    - name: Run task only on hosts with both 'web_servers' and 'linux' group membership
      debug:
        msg: "This task will run only on hosts in both 'web_servers' and 'linux' groups"
      when: "'web_servers' in group_names and 'linux' in group_names"

    - name: Run task only on hosts without CentOS operating system
      debug:
        msg: "This task will run only on non-CentOS hosts"
      when: ansible_os_family != 'RedHat'


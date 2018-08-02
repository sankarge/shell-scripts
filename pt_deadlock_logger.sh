socket=/var/opt/na/mysql-1/mysql.sock

/opt/alu-rp-rhel6-x86_64-9.3-5/bin/pt-deadlock-logger u=root,p=mysql --socket=$socket --create-dest-table --log=/var/opt/na/log/mysql-1/pt_deadlocks.log --daemonize

/opt/alu-rp-rhel6-x86_64-9.3-5/bin/pt-deadlock-logger u=root,p=mysql --socket=$socket --create-dest-table --dest D=test,t=pt_deadlocks --daemonize

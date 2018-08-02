echo "creating $1 users.."

for(( i=1;i<=$1; i++ ))
{

userid=interview$i

echo "Executing: useradd -d /home/$userid -s /bin/bash -m $userid"
sudo useradd -d /home/$userid -s /bin/bash -m $userid

echo $userid:welcome | chpasswd

su - $userid -s/bin/bash -c vncserver :$i
}


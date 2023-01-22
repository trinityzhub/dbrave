#!/bin/bash

##
## 
##

## maintained by: hkdb <hkdb@3df.io>
echo "hiii $1"


echo -e "\n"
read -p 'Enter  container name (eg: dbrave-spring ): ' CONTAINER_NAME
export HOME="ubbe"
sed  's|HOME|'$HOME'|g; s|BRAVED|'$CONTAINER_NAME'|g'  dBrave.desktop.skel > $CONTAINER_NAME.desktop

echo -e "\n"
read -p 'Would you like to add a shortcut to Gnome Launcher? (Y/n): ' GL


git reset --hard && git clean -df &&  git pull


less /etc/passwd


export user=ubbe group=docker uid=1000 gid=998 && \
    mkdir -p /home/${user} && \
 ##   groupadd -g 998 ${group} && \
 ##   useradd --uid ${uid} --gid ${gid} -d /home/${user} -ms /bin/bash ${user} && \
    chown -R ${user}:${group} /home/${user}



export user="codespace" group="dev" uid=1000 gid=998 && \
    mkdir -p /home/${user} && \
    groupadd -g 998 ${group} && \
    useradd --uid ${uid} --gid ${gid} -d /home/${user} -ms /bin/bash ${user} && \
    chown -R ${user}:${group} /home/${user}




sudo chown $USER:docker $HOME/.local/bin/dbrave-spring
sudo chown $USER:docker $HOME/.local/share/applications/dbrave-spring.desktop


sudo chmod +x   $HOME/.local/bin/dbrave-spring
sudo chmod +x   $HOME/.local/share/applications/dbrave-spring.desktop
    


cd $HOME/.local/bin
./dbrave-spring





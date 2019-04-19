if [[ $# -eq 0 ]] ; then
    echo 'You need specify site'
    exit 1
fi

source /etc/create-laravel-project.conf

sudo cp /usr/share/create-laravel-project/stubs/apache-site.stub /etc/apache2/sites-available/$1.conf
sudo sed -i "s~{server_root}~$PUBLIC_HTML~" /etc/apache2/sites-available/$1.conf
sudo sed -i "s/{site}/$1/g" /etc/apache2/sites-available/$1.conf
sudo a2ensite $1.conf
sudo service apache2 restart

echo "Site $1 is created!";
echo -e "Do not forget add \e[1m\e[32m127.0.0.1 $1\e[0m to /etc/hosts file!";
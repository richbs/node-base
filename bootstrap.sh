apt-get update
apt-get install -y python-software-properties
add-apt-repository -y ppa:chris-lea/node.js
apt-get update

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli -y > /dev/null
 
echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Setting MySQL Auth"
apt-get install debconf-utils -y 
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

apt-get install -y apache2 git mongodb nodejs python-dev python-pip mysql-server nodejs

echo "Do non-sudo global npm"

mkdir -p "/home/vagrant/.npm-packages"
echo 'NPM_PACKAGES="/home/vagrant/.npm-packages"' >> "/home/vagrant/.bashrc"
touch /home/vagrant/.npmrc
chown -R vagrant:vagrant /home/vagrant
echo 'prefix=/home/vagrant/.npm-packages' >>  "/home/vagrant/.npmrc"
echo 'NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"' >> "/home/vagrant/.bashrc"
echo 'PATH="$NPM_PACKAGES/bin:$PATH"' >> "/home/vagrant/.bashrc"
echo 'unset MANPATH # delete if you already modified MANPATH elsewhere in your config' >> "/home/vagrant/.bashrc"
echo 'MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> "/home/vagrant/.bashrc"


# echo "npm install stuff"
# npm install --global yo bower grunt-cli mean-cli

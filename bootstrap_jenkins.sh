if [ "$(id -u)" != "0" ] 
then
	echo "Must be run as root"
	exit 
fi

wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sources_file="/etc/apt/sources.list"
new_source="deb http://pkg.jenkins-ci.org/debian binary/"
echo "$new_source" | tee -a "$sources_file"
apt-get update
apt-get install -y jenkins

apt-get install -y python-pip

apt-get install -y awscli
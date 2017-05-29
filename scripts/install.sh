#/usr/bin/env bash

admin_user="admin"
admin_pwd="password"
admin_email="$admin_user@example.com"

print_help () {
  echo "#################################################"
  echo "                     HELP                        "
  echo "#################################################"
  echo "You can connect to the VM by taping 'vagrant ssh'"
  echo "You can shutdown the VM by typing 'vagrant halt'"
  echo "You can relaunch the VM by typing 'vagrant up'"
  echo "You can delete the VM by typing 'vagrant destroy'"
  echo "You can verify that packages are up to date by typing 'vagrant provision'\n"
  echo "Django admin informations"
  echo "Username = $admin_user"
  echo "Password = $admin_pwd"
  # TODO Add help for launching Django application from command line
  # TODO Add help for migrating database
  # TODO Add help for importing database
  # TODO ...
}

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y upgrade

# Installation de python et Django
apt-get install -y python3.6
apt-get install -y python3-pip
pip3 install --upgrade pip
pip3 install django



# Installation de Docker
apt-get install -y docker

# Installation de latex
# TODO installation des librairies latex (lesquelles ?)

# Mise à jour de la base de données
/usr/bin/python3.6 /vagrant/manage.py makemigrations
/usr/bin/python3.6 /vagrant/manage.py migrate

# Create user admin
echo "from django.contrib.auth.models import User; User.objects.filter(email='$admin_email').delete(); User.objects.create_superuser('$admin_user', '$admin_email', '$admin_pwd')" |/usr/bin/python3.5 /vagrant/manage.py shell


print_help
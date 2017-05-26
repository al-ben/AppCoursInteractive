# Migrate database on AppCoursInteractive VM

vagrant ssh -c "/usr/bin/python3.6 -u /vagrant/manage.py makemigrations"
vagrant ssh -c "/usr/bin/python3.6 -u /vagrant/manage.py migrate"
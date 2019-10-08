# Quick Deploy Laravel Project

This is package for quick deploy laravel project with necessary development tools. Supported only **apache2** so far.

Packages included:  
* [Laravel](https://github.com/laravel/laravel)
* [Laravel Admin](https://github.com/z-song/laravel-admin)
* [IDE Helper](https://github.com/barryvdh/laravel-ide-helper)
* [Debug Bar](https://github.com/barryvdh/laravel-debugbar)
* [Admin Widget Generator](https://github.com/denis-kisel/laravel-admin-widget)
* [Constructor](https://github.com/denis-kisel/constructor-laravel)
* [Arliot Widget](https://github.com/arrilot/laravel-widgets)

## Installation

Open bash and run commands

``` bash
$ cd ~/Downloads && git clone https://github.com/denis-kisel/laravel-quick-deploy-deb
$ cd laravel-quick-deploy-deb && sudo dpkg -i create-laravel-project_0.1-1.1_all.deb
```

## Settings
``` bash
$ sudo nano /etc/create-laravel-project.conf

# Default settings
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=

DOMAIN_POSTFIX='.loc'

#server directory(abs path)
PUBLIC_HTML='/var/www/'
```

## Usage

``` bash
# Go to server root directory
# Default /var/www
$ cd /to/your/server/www 

# Create new project
# command: lara-new {site-name}
$ lara-new new-site

# Add your site in the hosts file
# With DOMAIN_POSTIX
# For example new-site.loc
$ sudo nano /etc/hosts
```

* Run the site by link *new-site.loc* (if you dont change the var DOMAIN_POSTFIX)
* Open admin panel by link *new-site.loc/admin* with access log/pass:admin/admin
* Use necessary tools witch was included


## Apt Depends
apache2 

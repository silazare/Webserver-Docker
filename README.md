## Webserver-Docker
### Work Web environment deployment for Ubuntu 16.04

- Packages used:
  - Docker-Compose
  - Nginx latest
  - Apache http 2.4
  - MariaDB 10.3
  - PhpMyAdmin
  - PHP-FPM

- Packages requirement before use:
  - Docker CE
  - Docker Compose

### Project tree:

 * [httpd](./httpd)				-- Apache configs
   * [httpd.conf](./httpd/httpd.conf)
 * [nginx](./nginx)				-- Nginx configs
   * [nginx.conf](./nginx/nginx.conf)
 * [src](./src)					-- Source project files
   * [protected](./src/protected)
     * [index.html](./src/protected/index.html)
   * [html](./src/html)				-- All static html files
     * [index.html](./src/html/index.html)
   * [php](./src/php)				-- All dynamic php files
     * [version.php](./src/php/version.php)
     * [index.php](./src/php/index.php)
     * [error.php](./src/php/error.php)
   * [index.php](./src/index.php)
 * [webserver.sh](./webserver.sh)		-- Script to control containers
 * [logs](./logs)				-- All apps log folder
   * [apache.log](./logs/apache.log)
   * [fpm-php.www.log](./logs/fpm-php.www.log)
 * [mariadb](./mariadb)				-- Folder for DB files
 * [php](./php)					-- PHP configs
   * [php.ini](./php/php.ini)
   * [Dockerfile](./php/Dockerfile)		-- Docker file to build php-fpm image
   * [www.conf](./php/www.conf)
 * [docker-compose.yml](./docker-compose.yml)	-- Main compose file to build up all services
 * [ubuntu-update.yml](./ubuntu-update.yml)  -- Ansible playbook for Ubuntu update
 * [hosts](./hosts)  -- Ansible hosts inventory file

### Usage:

- Clone this repository to your folder:
```sh
$ git clone https://github.com/silazare/Webserver-Docker.git
$ cd Webserver-Docker
```
- Startup docker:
```sh
$ ADMIN_PASSWORD=<your db pass> docker-compose up --build -d
```
Example:
```
$ ADMIN_PASSWORD=admin docker-compose up --build -d 
```

- Check all services started up and veirfy HTTP to localhost IP:
```
$ docker ps -a
$ curl localhost
```

- Check webserver.sh control script for simple operations

### Maintenance:

For Ubuntu upgrades and reboot (if required) there is an ansible playbook.
Need to edit inventory hosts file and execute only from control machine (not locally):
```
$ ansible-playbook ubuntu-update.yml -i hosts -k
```
if ssh passwordless:
```
$ ansible-playbook ubuntu-update.yml -i hosts
```

## Webserver-Docker
### Work Web environment deployment for Ubuntu 16.04

- Packages used:
  - Docker-Compose
  - Nginx latest
  - Apache http 2.4
  - MariaDB 10.3
  - PhpAdmin
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
 * [set_db_pwd.sh](./set_db_pwd.sh)		-- Script to setup DB password
 * [docker-compose.yml](./docker-compose.yml)	-- Main compose file to build up all services

### Usage:

- Clone this repository to your folder:
```sh
$ git clone https://github.com/silazare/Webserver-Docker.git
$ cd Webserver-Docker

Set MySQL password before startup:
$ ./set_db_pwd.sh
```

- Startup docker:
```sh
$ ./webserver.sh start
or
$ docker-compose up --build -d 
```

- Check all services started up and veirfy HTTP to localhost IP:
```
$ docker ps -a
$ curl localhost
```


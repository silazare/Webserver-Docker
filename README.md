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

- Project tree:
.
 * [httpd](./httpd)
   * [httpd.conf](./httpd/httpd.conf)
 * [nginx](./nginx)
   * [nginx.conf](./nginx/nginx.conf)
 * [src](./src)
   * [protected](./src/protected)
     * [index.html](./src/protected/index.html)
   * [html](./src/html)
     * [index.html](./src/html/index.html)
   * [php](./src/php)
     * [version.php](./src/php/version.php)
     * [index.php](./src/php/index.php)
     * [error.php](./src/php/error.php)
   * [index.php](./src/index.php)
 * [webserver.sh](./webserver.sh)
 * [logs](./logs)
   * [apache.log](./logs/apache.log)
   * [fpm-php.www.log](./logs/fpm-php.www.log)
 * [mariadb](./mariadb)
 * [php](./php)
   * [php.ini](./php/php.ini)
   * [Dockerfile](./php/Dockerfile)
   * [www.conf](./php/www.conf)
 * [set_db_pwd.sh](./set_db_pwd.sh)
 * [docker-compose.yml](./docker-compose.yml)
 * [README.md](./README.md)

├── docker-compose.yml -- Main compose file to build up all services
├── httpd              -- Apache configs
│   └── httpd.conf       
├── logs               -- All apps log folder
│   ├── apache.log  
│   └── fpm-php.www.log
├── mariadb            -- Folder for DB files
├── nginx
│   └── nginx.conf     -- Nginx configs
├── php                -- PHP configs
│   ├── Dockerfile     -- Docker file to build php-fpm image
│   ├── php.ini
│   └── www.conf
├── README.md
├── set_db_pwd.sh      -- Script to setup DB password
├── src                -- Source project files
│   ├── html           -- All static HTML files
│   │   └── index.html
│   ├── index.php      -- Index file
│   ├── php            -- All dynamic PHP files
│   │   ├── error.php  -- Sample php error
│   │   ├── index.php  -- Sample php code
│   │   └── version.php 
│   └── protected      -- Sampled denied httpd folder
│       └── index.html
└── webserver.sh       -- Script to control containers

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


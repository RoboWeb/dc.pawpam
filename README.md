# DC.PAMPAW

## v.1.3

**D**ocker **C**ompose schema, **P**HP, **A**pache, **M**ySQL for **P**HP **A**pplication **w**ith:

---

Pampaw - is a simple Docker Compose schema, for easy developing of PHP Applications with databases, cache and other. Based on PHP docker image with Alpine v.3.14, PHP 7.4.22, and additional instalation of Apache v.2.4; and MySQL (v.8.0.x) docker image. And - if needed - PHPMyAdmin docker image, and Redis docker image.

This is project with PHP Fat-Free Framework on board!

For propper work system required:
- docker
- docker compose

---

### How to use?

I recommend: 
1. download this repository;
2. run `docker-compose up -d`
3. log into `phpapp:x.x` container
4. after 3, in terminal, run `cd ..` (You should be in /var/www/aoo directory) and `composer install`
5. After that logout from container
6. go to `phpapp` directory;
7. create or git clone what repository of PHP app You needed.

to be continued...

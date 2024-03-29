# Migrating edX to Quince version

Upgrading Open edX can be a time-consuming endeavor. Traditionally, the process involved following a native method, 
where each migration step is executed sequentially or release by release. It's essential to note that you cannot 
directly leap from a lower version to a higher one without traversing through all the intermediate versions.

This sequential approach is susceptible to errors. Alternatively, Tutor follows a similar method, but it requires a 
significant amount of manual intervention.

While not mandatory, having expertise in the following technologies and platforms can greatly facilitate the migration 
process:

- Ubuntu/Linux
- Docker
- Open edX
- Tutor
- MySQL
- MongoDB

Common errors encountered during the migration process include issues with encoding, skipping versions, cached images 
from previous setups, and random interruptions in the migration process.

- Encoding problems can often be resolved by setting the appropriate encoding in the database.
- It's crucial not to skip any intermediate versions during the migration process.
- Cached Docker images can be addressed by removing earlier images.
- If the migration process unexpectedly halts, restarting the process may resolve the issue.


## Koa to Lilac

### Install Koa release

```
sudo curl -L "https://github.com/overhangio/tutor/releases/download/v11.3.1/tutor-$(uname -s)_$(uname -m)" -o .venv/bin/tutor

sudo chmod 0755 .venv/bin/tutor

tutor --version (make sure it's version 11.3.1)

tutor local quickstart 
```

- In a new terminal, copy your mongodb dump of edxapp and cs_comment_service. Make sure that it's a dump file and not a 
full DB (dump will be a folder with .bson and .json etc., and a full DB will be with .wt .lock WiredTiger etc./).

- Move it to `TUTOR_ROOT/data/mongodb/`

- Copy your mySQL dump file and move it to `TUTOR_ROOT/data/mysql`.

```
tutor local exec mongodb bash (if this command does not work try)
or 
docker exec -it mongodb /bin/bash
```

```
mongorestore -d openedx /data/db/edxapp

mongorestore -d openedx /data/db/openedx
```

- Change the folder names accordingly. Here make sure that database name is `openedx`, in tutor, db-name is `openedx` 
and in native db-name is `edxapp`, do not get bamboozled by this.

```
mongorestore -d cs_comments_service /data/db/cs_comments_service 
```

```
docker exec -it tutor_local_mysql_1 /bin/bash
```

If this command does not work, run a `docker ps` and grab the id of mysql container and then do the `exec` command.

Open your `config.yml` and copy your `MYSQL_ROOT_PASSWORD` for this. Once inside the container fire the below commands.

```
mysql -uroot -p  COPIED_PASSWORD
show databases;
drop database openedx;
CREATE DATABASE openedx character set utf8 collate utf8_general_ci;
exit
mysql -uroot -pCOPIED_PASSWORD openedx < /var/lib/mysql/YOUR_SQL_DUMP_FILE_NAME.sql
```

Now create superuser or your user

```shell
tutor local createuser --staff --superuser YOUR_USERNAME your@email.com
```

Run your sanity checks and then 

```shell
tutor local stop
```

Now we start the upgrade process.

```
sudo curl -L "https://github.com/overhangio/tutor/releases/download/v12.2.0/tutor-$(uname -s)_$(uname -m)" -o .venv/bin/tutor

sudo chmod 0755 .venv/bin/tutor

OR

pip install "tutor[full]==12.2.0"
```

If installation complains that certain tutor versions are incompatible, then delete them or uninstall them 

```
tutor local upgrade --from=koa

tutor local quickstart

tutor local stop
```


## Lilac to Maple

In the same environment, install a newer version.

```
pip install "tutor[full]==13.3.1"
(If installation complains that certain tutor version are incompatilbe, then delete them or uninstal them)

tutor local upgrade --from=lilac

tutor local quickstart

tutor local run cms ./manage.py cms simulate_publish

tutor local stop
```

Extra command here is that of `simulate_publish`. If you don't do this, your courses won't appear.


## Maple to Nutmeg

In the same environment, install a newer version.

```
pip uninstall tutor-richie

pip install "tutor[full]==14.2.3"

tutor local upgrade --from=maple    

tutor local quickstart

tutor local run cms ./manage.py cms backfill_course_tabs

tutor local stop
```

Extra command here is that of `backfill_course_tabs`, if you don't do this, courses start giving error because of 
missing tabs.


## Nutmeg to Olive

In the same environment, install a newer version.

```
pip install "tutor[full]==15.3.1"

tutor local upgrade --from=nutmeg

tutor local launch
```

This can fail if you are also working on an Olive version in another environment in your machine. The reason for 
failure here is that it'll take the image which you might be using in another environment, so either remove the image 
or rename it.


## Olive to Palm

```
pip install "tutor[full]==16.1.8"

tutor config save

tutor local upgrade --from=olive

tutor local launch
```


## Palm to quince

```
pip install "tutor[full]==17.0.1"

tutor config save

tutor local upgrade --from=palm

tutor local launch
```

## After upgrade steps

- Run your sanity checks

- Then perform a dump

`tutor local exec mongodb bash` (If this does not work, try with "docker exec -it")

```
mongodump -d openedx --out /data/db/openedx_converted

mongodump -d cs_comments_service --out /data/db/forum_converted
```

Now, copy the mysql root password from `config.yml`.

```
docker exec -it tutor_local_mysql_1 /bin/bash
OR
docker exec -it tutor_local-mysql-1 /bin/bash

mysqldump -uroot -p openedx > /var/lib/mysql/openedx_converted.sql
```

- Now you can copy the files from `TUTOR_ROOT/data/mysql` & `TUTOR_ROOT/data/mongo`  respectively. 

- Upload them to required places

```
mysql -uroot -p openedx < /var/lib/mysql/file.sql

mongorestore -d openedx /data/db/openedx_converted/openedx

mongorestore -d cs_comments_service /data/db/forum_converted/cs_comments_service
```


## Sanity Checklist 

- Login with an existing user.

- Check the admin console to see and compare the number of users before and after migration.

- Check course overviews and compare number of courses before and after migration.

- Go to the Studio and see if the courses are present.

- Go to the Studio and check if the archived courses are present.
 
- Go to the Studio and check if the libraries are present.

- Go to courses and navigate to units and see if the data is present. 

- Go to a course content and ensure that the videos, images and text xblocks, etc., are present.

- Go to a course content and ensure the exams are present.

- Go to a course content and ensure the certificates are present.

- Go to a random course content and ensure SCORM XBlocks and packages are present. 

- Go to settings and ensure the dates, course_overview and course description is present. 

- Go to learner frontend and ensure that the courses are visible in the dashboard. 

- Go to learner frontend and ensure the learner can view and consume course content. 
 
- Create OAuth configuration for Studio and Learners.

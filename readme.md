I couldn't find a way for this container to execute a script when in builds.

To create the index template, `exec` into the container and run
```sh
$ ./init.d/setup.sh
```
**before** you index your data.

It will create templates for all files in the `templates` directory, using the name of the *.json file as the name of the index.


In development, this can look something like this. First run the index-template. Then index the data from the database.

```sh
$ docker exec -it kob-search-dev ./init.d/setup.sh
$ docker exec -it kob-web-dev php ./bin/search.php
```
# Install project

## Requirements

- docker
- docker-compose

## Quick install

Installation is supposed to be very simple
```
make s
```

You can replace the name of the django folder "project" by one custom name

## Reinstalling project

Follow directives from: https://docs.docker.com/samples/django/

Remove project folder and manage.py file.

```
rm -R project
rm manage.py
```

Create the django project inside django_docker folder

```
 sudo docker-compose run django django-admin startproject project .
```

Change files and folders owners:

```
sudo chown -R $USER:$USER .
```

Update database conf

```
# settings.py
   
import os
   
[...]
   
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': 5432,
    }
}
```
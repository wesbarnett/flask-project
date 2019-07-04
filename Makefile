
WWWDIR ?= /srv/www/flask-project

install:
	install -m 644 extra/nginx.conf /etc/nginx/nginx.conf
	install -m 644 extra/gunicorn.service /etc/systemd/system/gunicorn.conf
	install -Dm644 application/app/* -t $(WWWDIR)/application/app/

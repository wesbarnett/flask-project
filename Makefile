
WWWDIR ?= /srv/www/flask-project

install:
	install -m 644 extra/nginx.conf /etc/nginx/sites-available/flask-project.conf
	ln -s /ets/nginx/sites-available/flask-project.conf /ets/nginx/site-enabled/flask-project.conf
	install -m 644 extra/gunicorn.service /etc/systemd/system/gunicorn.service
	install -Dm644 application/app/* -t $(WWWDIR)/application/app/
	systemctl enable --now gunicorn
	systemctl restart nginx

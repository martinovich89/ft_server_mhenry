# This script will check if autoindex is on / off, and disable / enable it accordingly

#!/bin/bash
conf_path1="/etc/nginx/sites-available/my_site_1"
conf_path2="/etc/nginx/sites-available/my_site_2"
link1="/etc/nginx/sites-enabled/my_site_1"
link2="/etc/nginx/sites-enabled/my_site_2"
if [ -h "$link1" ]
then
	rm $link1 && \
	ln -s $conf_path2 $link2 && \
	service nginx restart && \
	echo "autoindex OFF"
else
	rm $link2 && \
	ln -s $conf_path1 $link1 && \
	service nginx restart && \
	echo "autoindex ON"
fi

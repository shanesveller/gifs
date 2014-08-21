#!/bin/sh
RSYNC_OPTS="-avPhzc --delete-after"
RSYNC_HOST=root@sys
RSYNC_FOLDER=/var/www/gifs.shsv.pics

./script/build_site_index && \
jekyll build && \
rsync $RSYNC_OPTS _site/ $RSYNC_HOST:$RSYNC_FOLDER

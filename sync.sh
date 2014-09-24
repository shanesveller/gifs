#!/bin/sh
RSYNC_OPTS="-avPhzc --delete-after"
RSYNC_HOST=root@sys
RSYNC_FOLDER=/var/www/gifs.shsv.pics

./script/build_site_index && \
jekyll build && \
rm -rf _site && \
mv build _site && \
rsync $RSYNC_OPTS _site/ $RSYNC_HOST:$RSYNC_FOLDER

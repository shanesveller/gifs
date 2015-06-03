#!/bin/sh
RSYNC_OPTS="-avPhzc --delete-after --prune-empty-dirs"
RSYNC_HOST=root@vps
RSYNC_FOLDER=/var/www/gifs.shsv.pics

./script/build_site_index && \
jekyll build && \
rsync $RSYNC_OPTS _site/ $RSYNC_HOST:$RSYNC_FOLDER
aws s3 sync --acl public-read --delete --profile $S3_PROFILE --size-only _site/ $S3_BUCKET

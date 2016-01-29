#!/bin/sh
./script/build_site_index && \
jekyll build --incremental && \
aws s3 sync --acl public-read --delete --profile $S3_PROFILE --size-only _site/ $S3_BUCKET

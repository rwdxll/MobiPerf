#!/bin/bash
#
# Author: gavaletz@google.com (Eric Gavaletz)

# This script laods data from the Speedometer service running on AppEngine to
# dev_appserver.  For more information on options try "appcfg.py --help" or
# https://developers.google.com/appengine/docs/python/tools/uploadingdata#Downloading_and_Uploading_All_Data

# To use this you should either have obtained an sql3 file from someone that
# has already run download_data.sh or run it yourself.  Make sure that the
# dev_appserver is running with the datastore development options selected see
# run_server_locally.sh for details.  This is not intended to update data on
# the GAE instance (really you shouldn't be doing that).

. ./script_config.sh

$PYTHON $APPCFG -e $USER_EMAIL -A dev~$APP_ID upload_data \
  --url=http://localhost:8080/_ah/remote_api \
  --log_file=$DATA_PATH/bulkloader-log-up \
  --db_filename=$DATA_PATH/bulkloader-progress-up.sql3 \
  --filename=$DATA_PATH

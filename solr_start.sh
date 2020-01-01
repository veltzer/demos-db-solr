#!/bin/sh
# this will start solr with no prompt and will automatically
# create the 'gettingstarted' collection

# these raising of limits with ulimit will remove the warnings
# you get when starting solr
# in /bin/sh
# ulimit -n 65536
# ulimit -p 65536
# in /bin/bash
# ulimit -n 65536
# ulimit -u 65536
# this doesn't work because we are raising limits here and not lowering them

cd ~/install/solr
bin/solr start -e cloud -noprompt

#!/bin/sh
# this will reverse the workings of 'solr_start.sh'
cd ~/install/solr || exit 1
# the -all is essential because otherwise you need to specify which nodes
# to stop. -all just stops them all
bin/solr stop -e cloud -all

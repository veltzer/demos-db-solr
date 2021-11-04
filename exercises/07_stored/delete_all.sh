#!/bin/bash
curl http://localhost:8983/solr/my_core/update -H "Content-type: text/xml" --data-binary "<delete><query>*:*</query></delete>"
curl http://localhost:8983/solr/my_core/update -H "Content-type: text/xml" --data-binary "<commit />"

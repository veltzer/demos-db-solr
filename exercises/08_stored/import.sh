#!/bin/bash
curl "http://localhost:8983/solr/my_core/update?commit=true" --data-binary @films.csv -H "Content-Type: application/csv"

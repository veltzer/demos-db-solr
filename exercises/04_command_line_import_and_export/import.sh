curl "http://localhost:8983/solr/films/update?commit=true" --data-binary @films.csv -H "Content-type:application/csv"

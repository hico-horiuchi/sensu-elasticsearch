## sensu handlers for elasticsearch

#### about

 - `elasticsearch_handler.rb`: sensu event data post to elasticserach index
 - `elasticsearch_metrics.rb`: sensu metrics data post to elasticserach index

#### how to use

 1. `cd /path/to/sensu/handlers`
 2. `wget https://raw.githubusercontent.com/hico-horiuchi/sensu-elasticsearch/master/elasticsearch_handler.rb`
 3. `wget https://raw.githubusercontent.com/hico-horiuchi/sensu-elasticsearch/master/elasticsearch_metrics.rb`
 4. `chmod 755 elasticsearch_*.rb`
 5. `cd /path/to/sensu/conf.d/`
 6. `wget https://github.com/hico-horiuchi/sensu-elasticsearch/master/handler_elasticsearch.json`
 7. please modify to suit your elasticsearch environment this `handler_elasticsearch.json`
 8. please restart sensu-server

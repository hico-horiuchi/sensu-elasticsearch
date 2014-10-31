#!/bin/sh
# Sensu Elasticsearch Mapping Script

URL=http://localhost:9200

curl -XPUT $URL/_template/sensu-metrics -d '{
  "template": "sensu-metrics-*",
  "mappings": {
    "_default_": {
      "numeric_detection" : true,
      "properties": {
        "@timestamp": { "type":"date", "format":"dateOptionalTime" },
        "client": {type: "string"},
        "address": {type: "string"},
        "check": {type: "string"},
        "status": {type: "integer"},
        "command": {type: "string"},
        "key": {type: "string"},
        "value": {type: "float"}
        }
      }
    }
  }
}'

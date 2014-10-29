#!/usr/bin/env ruby
# Sensu Elasticsearch Mapping Script

url = 'http://localhost:9200'

checks = [
  'cpu-usage-metrics',
  'disk-usage-metrics',
  'memory-metrics-percent',
  'temperature-metrics'
]

checks.each do |check|
  command = <<-EOS
curl -XPUT #{url}/_template/#{check} -d '{
  "template": "sensu-metrics-*",
  "mappings": {
    "#{check}": {
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
  EOS
  # command = "curl -XDELETE #{url}/_template/#{check}"
  puts "#{check} #=>"
  system command
  puts ''
end

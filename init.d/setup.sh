#!/bin/bash

baseUrl='127.0.0.1:9200'
contentType='Content-Type:application/json'

until $(curl -o /dev/null -s --head --fail $baseUrl); do
    echo "Waiting for ES to start..."
    sleep 5
done


# This script sets up the es5 docker instance with the correct pipelines and templates


# template
echo -e "\n\nsetting up templates..."
sleep 1

cd /usr/share/elasticsearch/templates
for f in *.json
do
    templateName="${f%.*}"
    templateUrl=$baseUrl'/_index_template/'$templateName

    echo -e "\ncreating index template for $templateName..."
    templateResult=$(curl -XPUT $templateUrl -H$contentType -d@$f)
    echo -e "$templateName result: $templateResult"
    sleep 1
done

echo -e "\n\n\nCompleted ES5 Setup, refer to logs for details"
exit 0
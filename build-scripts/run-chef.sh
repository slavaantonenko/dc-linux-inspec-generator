#!/bin/bash
cookbook=$1
recipe=$2
cd /inspec-gen
unzip mount/$cookbook.zip -d /inspec-gen/$cookbook/
#cp /inspec-gen/$1/Berksfile /inspec-gen
cd /inspec-gen/$cookbook
berks vendor ../cookbooks
#mv berks-cookbooks /inspec-gen/cookbooks
cd /inspec-gen
if grep -q NOJSON /inspec-gen/mount/$cookbook.json ; then
  jsoncommand=""
else
  jsoncommand="-j /inspec-gen/mount/$cookbook.json"
fi
chef-solo -c solo.rb -o "recipe[$cookbook::$recipe]" $jsoncommand -W --no-color -L /tmp/chef.log

#!/bin/bash

version=$(awk '$2 == "TESTAPP_VERSION" { print $3; exit }' testapp/Dockerfile | cut -d'~' -f1)

echo "$version" > image-params/tag

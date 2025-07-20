#!/bin/bash

# exit when any command fails
set -e

# Define the Docker account
docker_account=nabeelhamad893

# The latest official nginx version is 1.29.0
nginx_version=1.29.0

new_ver=$1

echo "new version: $new_ver"

# Simulate release of the new docker images.
docker tag nginx:$nginx_version $docker_account/nginx:$new_ver

# Push new version to dockerhub
docker push $docker_account/nginx:$new_ver

# Create temporary folder
tmp_dir=$(mktemp -d)
echo $tmp_dir

# Clone GitHub repo
git clone git@github.com:nabeelaccount/simple-argocd-2.git $tmp_dir

# Update image tag
sed -i '' -e "s/$docker_account\/nginx:.*/$docker_account\/nginx:$new_ver/g" $tmp_dir/my-app/1-deployment.yaml

# Commit and push
cd $tmp_dir
git add .
git commit -m "Update image to $new_ver"
git push

# Optionally on build agents - remove folder
rm -rf $tmp_dir

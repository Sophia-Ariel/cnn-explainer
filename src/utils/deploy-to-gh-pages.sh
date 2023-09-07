#!/bin/bash
set -o errexit

# config
# git config --global user.email "xiao.hk1997@gmail.com"
# git config --global user.name "xiaohk"

# build
# git clone git@github.com:poloclub/cnn-explainer.git
# cd cnn-explainer

npm install
npm run build

mkdir dist
cp -r ./public/* ./dist
sed -i '' 's/poloclub/sophia-ariel/g' ./dist/index.html
# add path prefix cnn-explainer
# sed -i '' 's/\/assets/\/cnn-explainer\/assets/g' ./dist/index.html 

git add dist -f
git commit -m "Deploy gh-pages"
git subtree push --prefix dist origin gh-pages

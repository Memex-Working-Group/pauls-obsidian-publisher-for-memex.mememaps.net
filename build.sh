node ./scripts/set_key_value_in_path.js \
  -i ./collective-memex/ \
  -t share \
  -v true


#!/bin/bash
source .env
echo 'build_path'
echo $build_path
rm -rf $build_path/markdown_flies/*md
rm -rf $build_path/docs/*
rm -rf $build_path/pkm.sqlite
node raw_to_sqlite.js \
    -dbf $build_path/pkm.sqlite \
    -i $pkm_in_path \
    -o $build_path \
    # -oi 5

# Build the markdown
cd $build_path
rm -rf docs/
python3 -m venv env
source env/bin/activate
python3 -m pip install mkdocs
python3 -m pip install mkdocs-material
python3 -m pip install mkdocs-backlinks
python3 -m pip install material-plausible-plugin
python3 -m mkdocs build -v

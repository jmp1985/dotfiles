#!/bin/bash

# Set all the target files
target=".vimrc
        .vim
        .tmux.conf"

# Get the script path
pushd `dirname $0` > /dev/null
script_path=`pwd -P`
popd > /dev/null

# Loop through all the targets
for t in $target 
do
  
  # Expand the path to the target and link
  l=~/$t
  t=$script_path/$t
  
  # Check that the target exists
  if [ ! -f $t ] && [ ! -d $t ]; then
    echo "Skipping $t: file doesn't exist"
    continue
  fi
 
  # Check that the link doesn't exist
  if [ -f $l ] || [ -d $l ]; then
    if [ ! -L $l ]; then
      echo "Moving   $l -> $l.backup"
      mv $l $l.backup
    else
      rm $l
    fi
  fi
  
  # Add a link
  echo "Linking  $t -> $l"
  ln -s $t $l
done


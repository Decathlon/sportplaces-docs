bundle exec middleman build --clean
cd build

if git remote -v | grep 'heroku'; then
  echo "<?php header( 'Location: /index.html' ) ;  ?>" > index.php
  git add .
  git commit -m 'Documentation build'
  git push heroku master
else
  echo 'Please configure the Heroku repository remote in the build directory'
fi
cd ..

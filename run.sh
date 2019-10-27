#/bin/sh

SO_INTERVAL=${SO_INTERVAL-900}

while true
do
  echo "Checking for new activity..."
  npm run start
  echo "Check finished. Sleeping for ${SO_INTERVAL}s..."
  sleep $SO_INTERVAL
done

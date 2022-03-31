#!/bin/bash
# deploy.sh non-containerized ci/cd

# stashing repository
echo "git stashing repository..."
git stash
if [ $? -ne 0 ];
then
  echo "error when stashing repository..."
  exit 1
fi

# pull repository
echo "git pull..."
git pull
if [ $? -ne 0 ];
then
  echo "error when pulling repository..."
  exit 1
fi

# activate virtual environment
source venv/bin/activate

echo "Install depedencies.."
pip install -r requirements.txt
if [ $? -ne 0 ];
then
  echo "Problem when installing depedencies, check requirements.txt.."
  exit 1
fi

# restarting the service
sudo systemctl restart gunicorn
sudo systemctl restart nginx

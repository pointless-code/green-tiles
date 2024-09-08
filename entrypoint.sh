#!/bin/sh

if [ -z "$GIT_EMAIL" ] || [ -z "$GIT_URL" ] || [ -z "$START_DATE" ] || [ -z "$END_DATE" ]; then
  echo "Error: GIT_EMAIL, GIT_URL, START_DATE and END_DATE environment variables must be set."
  exit 1
fi

git config --global user.email "$GIT_EMAIL"

cp /root/.ssh/my_ssh_key /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

ssh-keyscan github.com >> /root/.ssh/known_hosts

echo "Cloning repository from $GIT_URL..."
git clone "$GIT_URL" /GreenTiles

cp fake_commits.sh /GreenTiles/fake_commits.sh

chmod +x /GreenTiles/fake_commits.sh

cd /GreenTiles
bash /GreenTiles/fake_commits.sh "$START_DATE" "$END_DATE"

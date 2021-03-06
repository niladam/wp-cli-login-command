# Provide SSH access to the repository
eval "$(ssh-agent -s)"
chmod 600 deploy/key
ssh-add deploy/key

# Download git-subsplit
wget https://github.com/dflydev/git-subsplit/raw/d77ec9d3e1addd97dca1464eabf95c525f591490/git-subsplit.sh
# Prepare for doing the subsplits
bash git-subsplit.sh init git@github.com:aaemnnosttv/wp-cli-login-command.git
# synchronize the plugin directory with its respective repository for the current branch
bash git-subsplit.sh publish --tags="$TRAVIS_TAG" plugin/:git@github.com:aaemnnosttv/wp-cli-login-server.git

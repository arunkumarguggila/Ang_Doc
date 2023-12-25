AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
git clone https://github.com/arunkumarguggila/Ang_Doc
cd Ang_Doc
rm -rf .git

cd ..

GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/TestGitSync/_git/TestGitSync"
git clone $GIT_CMD_REPOSITORY

cp -r testAzureDevops/* TestGitSync/

cd TestGitSync

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from github to azure"

git push

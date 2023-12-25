AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
git clone https://github.com/arunkumarguggila/Ang_Doc
cd Ang_Doc
rm -rf .git

cd ..

GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/_git/GItLad_test"
git clone $GIT_CMD_REPOSITORY

cp -r Ang_Doc/* GItLad_test/

cd GItLad_test

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from git to azure"

git push

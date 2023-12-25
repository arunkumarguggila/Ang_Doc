#!/bin/bash

AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG

# Clone GitHub repository
git clone 'https://github.com/arunkumarguggila/Ang_Doc'
cd Ang_Doc

# Navigate back to the parent directory
cd ..

# Clone Azure DevOps repository
GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/GItLad_test/_git/GItLad_test/"
git clone "$GIT_CMD_REPOSITORY"  # Enclose URL in double quotes

# Copy files from GitHub to Azure DevOps
cp -r Ang_Doc/* GItLad_test/

# Navigate to the Azure DevOps repository
cd GItLad_test

# Configure Git user information
git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

# Commit and push changes
git add .
git commit -m "Sync from GitHub to Azure DevOps"
git push

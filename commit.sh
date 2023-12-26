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
GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/arunguggila/_git/arunguggila"
git clone "$GIT_CMD_REPOSITORY"  # Enclose URL in double quotes

# Copy files from GitHub to Azure DevOps
cp -r Ang_Doc/* arunguggila/

# Navigate to the Azure DevOps repository
cd arunguggila

# Configure Git user information
git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

# Get the current date and time
datetime=$(date +"%Y-%m-%d_%H-%M-%S")
# Create a branch with the current date and time
branch_name="feature/branch_$datetime"

# Commit and push changes
git add .
git branch "$branch_name"
git commit -m "Sync from GitHub to Azure DevOps"
git push

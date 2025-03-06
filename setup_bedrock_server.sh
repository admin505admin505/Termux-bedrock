#!/bin/bash

# Change to the Minecraft server directory
cd ~/minecraft_server

# Download the latest version of Minecraft Bedrock server
wget -O bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.10.01.zip

# Unzip the server files
unzip bedrock-server.zip

# Remove the zip file
rm bedrock-server.zip

# Make the bedrock_server executable
chmod +x bedrock_server

echo "Minecraft Bedrock server setup complete. You can start the server by running ./start_minecraft_server.sh"
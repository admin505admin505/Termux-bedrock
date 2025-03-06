#!/bin/bash

# Update and upgrade Termux packages
pkg update && pkg upgrade -y

# Install necessary packages
pkg install wget unzip screen -y

# Set variables
BEDROCK_VERSION="1.19.62.01"  # Change this to the latest version if needed
BEDROCK_SERVER_URL="https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_VERSION}.zip"
BEDROCK_SERVER_DIR="$HOME/bedrock-server"

# Create server directory if it doesn't exist
mkdir -p $BEDROCK_SERVER_DIR

# Download the Bedrock server zip file
wget $BEDROCK_SERVER_URL -O $BEDROCK_SERVER_DIR/bedrock-server.zip

# Unzip the Bedrock server files
unzip $BEDROCK_SERVER_DIR/bedrock-server.zip -d $BEDROCK_SERVER_DIR

# Clean up the zip file
rm $BEDROCK_SERVER_DIR/bedrock-server.zip

# Create a script to start the server with screen
cat << 'EOF' > $BEDROCK_SERVER_DIR/start.sh
#!/bin/bash
cd $(dirname $0)
LD_LIBRARY_PATH=. ./bedrock_server
EOF

# Make the start script executable
chmod +x $BEDROCK_SERVER_DIR/start.sh

# Create a script to run the server in a screen session
cat << 'EOF' > $HOME/start_bedrock_server.sh
#!/bin/bash
screen -dmS bedrock_server $HOME/bedrock-server/start.sh
EOF

# Make the screen starter script executable
chmod +x $HOME/start_bedrock_server.sh

# Instructions
echo "Bedrock server setup is complete."
echo "To start the server, run: ./start_bedrock_server.sh"
echo "To attach to the server screen session, run: screen -r bedrock_server"
echo "To detach from the screen session, press: Ctrl+A and then D"
#!/bin/bash
set -e

echo "🚀 Starting linux-auto-update deployment..."

# Copy the update script
sudo cp linux-auto-update/update.sh /usr/local/bin/auto-update.sh
sudo chmod +x /usr/local/bin/auto-update.sh

# Copy systemd files
sudo cp systemd/auto-update.service /etc/systemd/system/
sudo cp systemd/auto-update.timer /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Enable boot service
sudo systemctl enable auto-update.service

# Enable and start the timer (07:00 and 19:00)
sudo systemctl enable --now auto-update.timer

# Create a terminal command 'update'
sudo tee /usr/local/bin/update > /dev/null <<< 'sudo /usr/local/bin/auto-update.sh'
sudo chmod +x /usr/local/bin/update

echo "✅ Deployment completed successfully!"
echo "Use the 'update' command to run the update manually."
#!/bin/bash
set -e

echo "🚀 Starting linux-auto-update deployment..."

# Copy the update script to /usr/local/bin/update.sh
sudo cp linux-auto-update/update.sh /usr/local/bin/auto-update.sh
sudo chmod +x /usr/local/bin/auto-update.sh

# Copy the systemd files to /etc/systemd/system/
sudo cp systemd/auto-update.service /etc/systemd/system/
sudo cp systemd/auto-update.timer /etc/systemd/system/

# Reload systemd to recognize the new files
sudo systemctl daemon-reload

# Enable the service to run at boot
sudo systemctl enable auto-update.service

# Enable and start the timer to run automatically at 07:00 and 19:00
sudo systemctl enable --now auto-update.timer

echo "✅ Deployment completed successfully!"
echo "Use the 'update' command to run the update manually."
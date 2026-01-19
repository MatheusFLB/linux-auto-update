#!/bin/bash
# Automatic update script
apt update && apt full-upgrade -y && apt autoremove -y
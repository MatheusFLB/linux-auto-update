# linux-auto-update
# UPDATE DE DEBIAN OU UBUNTU AUTOMÁTICO NA INICIALIZAÇÃO
### crie o arquivo para o script
```
sudo nano /usr/local/bin/auto-update.sh
```
#### conteúdo que deve ser colado no arquivo do script
```
#!/bin/bash
# Script de atualização automática
apt update && apt full-upgrade -y && apt autoremove -y
```
### torne o script executável
```
sudo chmod +x /usr/local/bin/auto-update.sh
```
### crie um serviço para executar no boot
```
sudo nano /etc/systemd/system/auto-update.service
```
#### conteúdo que deve ser colado no arquivo do serviço
```
[Unit]
Description=Atualização automática do sistema
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/auto-update.sh

[Install]
WantedBy=multi-user.target
```
### habilite o serviço
```
sudo systemctl daemon-reload
sudo systemctl enable auto-update.service
```
### reboot para testes
```
sudo reboot
```
### verifique os logs após o reboot
```
journalctl -u auto-update.service
```

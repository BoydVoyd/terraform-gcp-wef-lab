# Install IIS
# Install-WindowsFeature -name Web-Server -IncludeManagementTools;

# Set up an admin user
net user nathan "IdoWhatIW@nt!" /add
net localgroup administrators nathan /add
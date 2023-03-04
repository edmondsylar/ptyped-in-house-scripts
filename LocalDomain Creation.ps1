# Running the script as an administrator is necessary because it requires administrative privileges to make changes to the Apache configuration file and the hosts file in the system32 directory. These files are critical system files that require elevated permissions to modify, and running the script as an administrator ensures that the necessary permissions are granted to make the changes successfully.

# Check if the user is an administrator
$currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# If the user is not an administrator, elevate the script
if (-not $isAdmin) {
    Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}


$domainName = Read-Host -Prompt 'Enter your preferred domain name'
$projectDirectory = Read-Host -Prompt 'Enter the path to your project source code directory'

# Set the path to the XAMPP Apache configuration file
$apacheConfigFile = 'C:\xampp\apache\conf\extra\httpd-vhosts.conf'

# Create a new virtual host entry
$virtualHostEntry = @"
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot "$projectDirectory"
    ServerName $domainName
    ErrorLog "logs/$domainName-error.log"
    CustomLog "logs/$domainName-access.log" common
</VirtualHost>
"@

# Append the new virtual host entry to the Apache configuration file
Add-Content -Path $apacheConfigFile -Value $virtualHostEntry

# Update the hosts file with the newly created local domain
$hostsFile = 'C:\Windows\System32\drivers\etc\hosts'
$hostsEntry = "`n127.0.0.1`t$domainName"
Add-Content -Path $hostsFile -Value $hostsEntry

$cred = Get-Credential netdomain\administrator
Enter-PSSession -ComputerName ActiveDirectory -Credential $cred

## Copy file from one session to local machine
$pc = New-PSSession -ComputerName ActiveDirectory -Credential $cred
Copy-Item -FromSession $pc C:\folder\file.msi -Destination C:\folder\file.msi

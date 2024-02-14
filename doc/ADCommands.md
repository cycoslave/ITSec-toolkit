Import-Module ActiveDirectory
Get-ADUser -Filter -Properties | export-csv c:\ADusers.csv

Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,OperatingSystemVersion,ipv4Address | Export-CSV ADcomputerslist.csv -NoTypeInformation -Encoding UTF8

Get-ADGroupMember -Server "domain-name-here" -Identity "Domain Admins" -Recursive | Get-ADUser | export-csv -path c:\folder\admins.csv 

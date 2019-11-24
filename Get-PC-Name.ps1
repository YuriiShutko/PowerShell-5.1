$name = Read-Host 'Enter the approximate name'

Get-ADComputer -Filter {name -like $name} -Properties * | Sort Name | FT Name, DNSHostName, Description, OperatingSystem, OperatingSystemVersion, IPv4Address, Created, LastLogonDate | Out-String -Width 1024
 
Read-Host -Prompt "Press Enter to exit"
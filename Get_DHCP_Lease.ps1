$DHCP_Server = "server_name"
$ScopesID = 'Scope id,...'
Write-Host " 
  Choose:  
    '1'   
    '2'   
    '3'   
    '4'  
    '5'   
    '6'   
    '7'  
    '8'   
    '9'   
   '10'  
   '11'   | All
   " -ForegroundColor Yellow

$Number = Read-Host "Please enter a scope id"
switch($Number) {
    1 { $ScopeID = $ScopesID[0] }
    2 { $ScopeID = $ScopesID[1] }
    3 { $ScopeID = $ScopesID[2] }
    4 { $ScopeID = $ScopesID[3] }
    5 { $ScopeID = $ScopesID[4] }
    6 { $ScopeID = $ScopesID[5] }
    7 { $ScopeID = $ScopesID[6] }
    8 { $ScopeID = $ScopesID[7] }
    9 { $ScopeID = $ScopesID[8] }
   10 { $ScopeID = $ScopesID[9] }
   11 { $ScopeID = $ScopesID }
}
$Approximate_name = Read-Host "Enter an aproximate name of device"
if ($Approximate_name) {
    foreach ($Scope in $ScopeID) {
        Get-DhcpServerv4Lease -ComputerName $DHCP_Server -ScopeId $Scope | Where HostName -Match $Approximate_name | Sort LeaseExpiryTime -Descending
    }
} 
else {
    foreach ($Scope in $ScopeID) {
        Get-DhcpServerv4Lease -ComputerName $DHCP_Server -ScopeId $Scope | Sort LeaseExpiryTime -Descending
    }
}
Read-Host "Press enter to continue"
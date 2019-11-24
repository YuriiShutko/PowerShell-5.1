$hostname = Read-Host 'Enter the approximate name'

$value = Get-ADComputer -Filter {name -like $hostname} -Properties * 
if ($value.IPV4Address) {
    $bool = Test-Connection -ComputerName $value.IPV4Address -quiet
    if ($bool -eq $True)
    {
        $hdds=Invoke-Command -ComputerName $value.Name -ScriptBlock {Get-PhysicalDisk | Select *} -ErrorVariable errmsg 2>$null
        if (!$errmsg) {
            Write-Host " "
            Write-Host "Physical Disks: " -ForegroundColor Green
            Write-Host "---------------" -ForegroundColor White 
            foreach ($hdd in $hdds)
            {
                $hdd | Format-Table -Property PSComputerName, FriendlyName, @{n="Size";e={[math]::Round($_.Size/1GB,2)}}, SerialNumber, MediaType, BusType | Out-String|% {Write-Host $_ -ForegroundColor Yellow -Separator "="} 
            }
        } else {
            Write-Host "Возникли ошибки, чтобы посмотреть - введите `$errmsg" -ForegroundColor Magenta
        }
    } else { 
        Write-Host "PC: $($value.Name) IP: $($value.IPV4Address) is offline" -ForegroundColor Magenta 
    }
} else {
    Write-Host "Не удается получить IP-адресс компьютера" -ForegroundColor Magenta 
}


    
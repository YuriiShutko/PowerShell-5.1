Get-content C:\Users\user\Desktop\new.txt | ForEach-Object{Set-ADUser $_ -PasswordNeverExpires $false}

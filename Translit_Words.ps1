    <# 
        23.11.2019
		y.shutko
    #>
    
    $Translit = @{
        [char]'а' = "a"
        [char]'А' = "A"
        [char]'б' = "b"
        [char]'Б' = "B"
        [char]'в' = "v"
        [char]'В' = "V"
        [char]'г' = "h"
        [char]'Г' = "H"
        [char]'д' = "d"
        [char]'Д' = "D"
        [char]'е' = "e"
        [char]'Е' = "E"
        [char]'ё' = "yo"
        [char]'Ё' = "Yo"
        [char]'ж' = "zh"
        [char]'Ж' = "Zh"
        [char]'з' = "z"
        [char]'З' = "Z"
        [char]'и' = "i"
        [char]'И' = "I"
        [char]'й' = "y"
        [char]'Й' = "Y"
        [char]'к' = "k"
        [char]'К' = "K"
        [char]'л' = "l"
        [char]'Л' = "L"
        [char]'м' = "m"
        [char]'М' = "M"
        [char]'н' = "n"
        [char]'Н' = "N"
        [char]'о' = "o"
        [char]'О' = "O"
        [char]'п' = "p"
        [char]'П' = "P"
        [char]'р' = "r"
        [char]'Р' = "R"
        [char]'с' = "s"
        [char]'С' = "S"
        [char]'т' = "t"
        [char]'Т' = "T"
        [char]'у' = "u"
        [char]'У' = "U"
        [char]'ф' = "f"
        [char]'Ф' = "F"
        [char]'х' = "h"
        [char]'Х' = "H"
        [char]'ц' = "ts"
        [char]'Ц' = "Ts"
        [char]'ч' = "ch"
        [char]'Ч' = "Ch"
        [char]'ш' = "sh"
        [char]'Ш' = "Sh"
        [char]'щ' = "shch"
        [char]'Щ' = "Shch"
        [char]'ъ' = ""
        [char]'Ъ' = ""
        [char]'ы' = "y"
        [char]'Ы' = "Y"
        [char]'ь' = ""
        [char]'Ь' = ""
        [char]'э' = "e"
        [char]'Э' = "E"
        [char]'ю' = "yu"
        [char]'Ю' = "Yu"
        [char]'я' = "ya"
        [char]'Я' = "Ya"
    }                                              #Создаём хеш-таблицу соответствия символов
   
    <# 
        Начальные параметры скрипта 
    #>
    Write-Host "Введите путь к файлу, который нужно конвертировать *.txt : " -ForegroundColor Yellow -NoNewline
    $path_to_file = Read-Host                                       #Записываем путь к файлу в переменную
    Write-Host "Введите путь куда будет записан файл (C:\Users\y.shutko\Desktop\new_names.txt) : " -ForegroundColor Yellow -NoNewline
    $end_file = Read-Host 
    Write-Host "Введите 'reverse' для изменения порядка имени и фамилии : " -ForegroundColor Yellow -NoNewline
    $reverse_trig = Read-Host 
        if ($reverse_trig -eq "reverse")                            #Условие проверки, нужен реверс или нет
            { $reverse = $True }
        else
            { $reverse = $False }

    
    $text=Get-Content -LiteralPath $path_to_file -Encoding UTF8     #Отправляем весь текст из файла в переменную
    $Result_Array=New-Object System.Collections.ArrayList           #Создание нового массива
    $Result_Array.addrange($text.split())                           #Добавление элементов в этот массив 
    
    if ($reverse) { 
        for($i=0;$i -lt $Result_Array.count;$i+=2)                  
        {
            $Result_Array.GetRange($i,2).reverse()                  #Меняем местами элементы массива
        }
    }

    <# 
        Перевод в транслитерацию 
    #>
    [string]$inString = $Result_Array
    $TranslitText =""
    foreach ($CHR in $inCHR = $inString.ToCharArray())
        {
        if ($Translit[$CHR] -cne $Null) 
            { $TranslitText += $Translit[$CHR] }
        else
            { $TranslitText += $CHR }
        }
        $demoSplit = $TranslitText.Split("")


    for ($i = 0; $i -ne ($demoSplit.Count); $i += 2)
    {
        $output_array = $demoSplit[$i] + ' ' + $demoSplit[$i+1]
        $output_array | out-file $end_file -Append
    }
    Write-Host "Данные записаны в файл $end_file" -ForegroundColor Green
    Remove-Variable -name Result_Array
    Remove-Variable -name demoSplit
    Read-Host "Нажмите Enter для выхода..."
  
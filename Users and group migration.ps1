try {
    Import-Module ActiveDirectory

    $ouDN = "OU=source,DC=source,DC=domain,DC=local"
    $outputFile = "C:\tools\users4mig.txt"  # Путь и имя файла для сохранения списка пользователей
    $groupFile = "C:\tools\groups4mig.txt"  # Путь и имя файла для сохранения списка групп

    # Получение списка учетных записей пользователей в OU
    $users = Get-ADUser -SearchBase $ouDN -Filter * -Properties SamAccountName

     # Вывод списка групп в консоль
    Write-Host "Список users в OU '$ouDN':"
    $users | Select-Object Name

    # Сохранение списка учетных записей пользователей в файл
    $users | Select-Object -ExpandProperty SamAccountName | Out-File -FilePath $outputFile

    # Получение списка групп в OU
    $groups = Get-ADGroup -SearchBase $ouDN -Filter * -Properties SamAccountName

    # Сохранение списка групп в файл
    $groups | Select-Object -ExpandProperty Name | Out-File -FilePath $groupFile

    # Вывод списка групп в консоль
    Write-Host "Список групп в OU '$ouDN':"
    $groups | Select-Object Name

    # Запуск файла пакетного скрипта ADMT
    Start-Process -FilePath "c:\tools\migrate_users.bat" -Wait
    Start-Process -FilePath "C:\tools\migrate_groups.bat" -Wait
}
catch {
    Write-Host "Ошибка при выполнении миграции: $_"
}

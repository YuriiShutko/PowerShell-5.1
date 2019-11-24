<#
  This script helps to get rid of long names of files. 
  You can choose which words will disappear in the final names of files typing these words in brackets. 
  You can also chose which type of file you want to rename. This script let you rename a lot of files immediately.
  For example you have file named "ПРАКТИКА - АНГЛИЙСКИЙ ЯЗЫК ДО АВТОМАТИЗМА УРОК 11 1 ГРАММАТИКА УРОКИ АНГЛИЙСКОГО". 
  Using this script you have the following : "ПРАКТИКА -  УРОК 11 1 .mp4".
#>

Get-ChildItem *.mp4 | Rename-Item -NewName { $_.name -replace "(АНГЛИЙСКИЙ ЯЗЫК ДО АВТОМАТИЗМА)|(ГРАММАТИКА УРОКИ АНГЛИЙСКОГО)","" }

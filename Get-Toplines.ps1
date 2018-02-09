# Toplines
## Get-TopLines.ps1
### Authored by Al
#### Suggestions and comments welcome

<#
.SYNOPSIS
Prints the first several lines of a file.

.DESCRIPTION
The Toplines command works like the UNIX head command,
printing the first several lines of a file. Optionally, the user can display line numbers.

.PARAMETER FileName
The name of the file to display.

.PARAMETER Lines
The number of lines to display, by default, 10.

.PARAMETER Numbers
If present, Get-TopLines will display line numbers along with the file's text.

.EXAMPLE
Get-TopLines -FileName myfile.txt
Displays the first 10 lines of a file named myfile.txt.

.EXAMPLE
Get-TopLines myfile.txt -Lines 14
Displays the first 14 lines of a file named myfile.txt.

.EXAMPLE
Get-TopLines myfile.txt -Numbers
Displays the first 10 lines of a file named myfile.txt along with line numbers.

.LINK
BEEP<☼_☼>BOOP
#>
[CmdletBinding()] param (
    [Parameter(Mandatory = $true)] [string] $FileName,
    [int] $Lines = 10,
    [switch] $Numbers
)

''
Write-Host -ForegroundColor Yellow $FileName
Write-Host -ForegroundColor Yellow $('- ' * 30)
Write-Debug 'Getting ready to fetch the file'
$LineNumber = 1

Get-Content $FileName -TotalCount $Lines |
        ForEach-Object {
               if ($Numbers) {
                   $NumberString = '{0,3} ' -f $LineNumber
                   $LineNumber++
                   Write-Host -ForegroundColor Green `
                    $NumberString -NoNewline

               }
               Write-Host $_
            }
''

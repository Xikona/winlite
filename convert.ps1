function Convert-FileToANSI {
    param($sourceFile, $destinationFile)
    if (Test-Path $sourceFile) {
        $tempFile = "$env:TEMP\temp.bat"
        Get-Content -Path $sourceFile -Encoding utf8 > $tempFile
        Set-Content -Path $destinationFile -Value (Get-Content -Path $tempFile -Encoding utf8) -Encoding ascii
        Remove-Item -Path $tempFile -Force
    }
}

$sourceFile = "AIO.bat"
$destinationFile = "AIO.bat"

Convert-FileToANSI -sourceFile $sourceFile -destinationFile $destinationFile
$key = "7931014131a737b13ea59a7ed76d1ee2"
$iv = "0000000000000000"
$file_in = "C:\dataToExfil\DATA.zip"
$file_out = "C:\dataToExfil\encrypted.txt"

[byte[]] $bytes = [System.IO.File]::ReadAllBytes($file_in)
$aes = New-Object System.Security.Cryptography.AesManaged
$aes.Key = [System.text.Encoding]::ASCII.GetBytes($key)
$aes.IV = [System.text.Encoding]::ASCII.GetBytes($iv)
$encryptor = $aes.CreateEncryptor()
$encrypted = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length)
[System.IO.File]::WriteAllBytes($file_out, $encrypted)

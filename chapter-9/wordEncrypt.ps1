# Embed the file FileToEncrypt.zip into a newly generated Word document
# document and encrypt it by setting a password
$word = New-Object -ComObject word.application
$word.Visible = $false
$doc = $word.documents.add()
$selection = $word.Selection

$selection.InlineShapes.AddOLEObject("","C:\dataToExfil\FileToEncrypt.zip")
$doc.Password = "complex pass!!!"
$doc.SaveAs("C:\dataToExfil\Encrypted.docx")

$doc.Close()
$word.Quit()

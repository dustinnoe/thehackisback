# Nest the file DATA.TXT 500 levels deep in the zip file name nested.zip
Compress-Archive -Path .\DATA.TXT -DestinationPath .\nested.zip
for($i=0;$i -lt 500; $i++){
    Compress-Archive -Path .\nested.zip -DestinationPath .\nestedtmp.zip  
    Remove-Item -Path .\nested.zip
    Rename-Item -Path .\nestedtmp.zip -NewName .\nested.zip
}

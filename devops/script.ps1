cd .\scripting
$json = Get-Content -Raw manifest.JSON | ConvertFrom-Json 
$archive = $json | Select-Object -ExpandProperty filename 
$archive
$donotdel= $archive 
$donotdel+= "manifest.json"
$donotdel+= "included.zip"
Get-ChildItem -Exclude $donotdel | Remove-Item -Recurse -Force
foreach($file in $archive) {
  Compress-Archive -Path .\$file -DestinationPath ".\included.zip" -Update
}
Get-ChildItem -Exclude included.zip,manifest.json | Remove-Item -Recurse -Force
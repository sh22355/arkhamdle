Add-Type -AssemblyName System.Drawing
Get-ChildItem 'C:\Games\Arkhamdle' -File | Where-Object { $_.Name -match 'harley|quinn' } | ForEach-Object {
  $img = [System.Drawing.Image]::FromFile($_.FullName)
  Write-Output ($_.Name + ' | ' + $_.Length + ' bytes | ' + $_.LastWriteTime + ' | ' + $img.Width + 'x' + $img.Height)
  $img.Dispose()
}

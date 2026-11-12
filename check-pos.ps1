$css = Get-Content 'C:\Games\Arkhamdle\index.html' -Raw
$selectors = '.scene-panel', '.scene-top', '.menu-shell', '.main-header', '.brand-row', '.game', '.gcdb-bulletin'
foreach ($s in $selectors) {
  $rx = [regex]::Escape($s) + '\s*(,[^{]+)?\s*\{([^}]*)\}'
  foreach ($m in [regex]::Matches($css, $rx)) {
    $body = $m.Groups[2].Value
    if ($body -match 'position|transform|filter|perspective|contain|will-change') {
      Write-Output ('=== ' + $s + ' ===')
      Write-Output ($body.Trim())
      Write-Output ''
    }
  }
}

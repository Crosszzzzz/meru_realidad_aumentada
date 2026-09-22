$h = (Invoke-WebRequest -UseBasicParsing 'https://menus-ar.vercel.app/').Content
if ($h -match 'mesa-theme') { Write-Output 'OK: script tema inline (mesa-theme)' } else { Write-Output 'FALTA: script tema' }
if ($h -match "id='theme-toggle'") { Write-Output 'OK: codigo boton theme-toggle' } else { Write-Output 'FALTA: boton' }
$tc = ([regex]::Matches($h, 'name="theme-color"')).Count
Write-Output "theme-color metas: $tc"
if ($h -match 'prefers-color-scheme: light') { Write-Output 'MAL: meta theme-color con media sigue' } else { Write-Output 'OK: sin meta theme-color por media' }
$css = [regex]::Match($h, 'assets/[^"]+\.css').Value
Write-Output "CSS: $css"
$c = (Invoke-WebRequest -UseBasicParsing ('https://menus-ar.vercel.app/' + $css)).Content
foreach ($p in @('html.dark', '.theme-toggle', 'Fraunces', 'Manrope', 'DM Sans', '@media (prefers-color-scheme: dark)')) {
  if ($c.Contains($p)) { Write-Output ('ENCONTRADO: ' + $p) } else { Write-Output ('AUSENTE: ' + $p) }
}

@echo off
setlocal
cd /d "%~dp0"
title Meera & Aditya Royal Wedding Invitation

echo ===============================================================
echo   Meera ^& Aditya - Royal Wedding Invitation Preview
echo   મીરા અને આદિત્ય - રોયલ વેડિંગ ઇન્વિટેશન પ્રિવ્યૂ
echo ===============================================================
echo.
echo [1/2] Starting instant local server on http://localhost:8080 ...
echo [2/2] Opening invitation in your default web browser...
echo.
echo Website running! Keep this window open while viewing.
echo આ વિન્ડો ચાલુ રાખો જ્યાં સુધી તમે વેબસાઇટ જોતા હોવ.
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$port = 8080; try { $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:' + $port + '/'); $listener.Prefixes.Add('http://127.0.0.1:' + $port + '/'); $listener.Start(); Start-Process ('http://localhost:' + $port + '/index.html'); Write-Host 'Server active on http://localhost:8080 (Press Ctrl+C or close window to exit)'; while ($listener.IsListening) { $context = $listener.GetContext(); $request = $context.Request; $response = $context.Response; $path = $request.Url.LocalPath.TrimStart('/'); if ([string]::IsNullOrWhiteSpace($path)) { $path = 'index.html' }; $path = [System.Uri]::UnescapeDataString($path); $file = Join-Path (Get-Location) $path; if (Test-Path $file -PathType Leaf) { $bytes = [System.IO.File]::ReadAllBytes($file); $response.ContentLength64 = $bytes.Length; $ext = [System.IO.Path]::GetExtension($file).ToLower(); switch ($ext) { '.html' { $response.ContentType = 'text/html; charset=utf-8' }; '.js' { $response.ContentType = 'application/javascript; charset=utf-8' }; '.css' { $response.ContentType = 'text/css; charset=utf-8' }; '.png' { $response.ContentType = 'image/png' }; '.jpg' { $response.ContentType = 'image/jpeg' }; '.jpeg' { $response.ContentType = 'image/jpeg' }; '.mp4' { $response.ContentType = 'video/mp4' }; '.svg' { $response.ContentType = 'image/svg+xml' }; '.json' { $response.ContentType = 'application/json; charset=utf-8' }; default { $response.ContentType = 'application/octet-stream' } }; $response.OutputStream.Write($bytes, 0, $bytes.Length) } else { $response.StatusCode = 404 }; $response.Close() } } catch { Start-Process ('http://localhost:' + $port + '/index.html'); Write-Host 'Server was already running or port in use, browser opened!' }"

pause

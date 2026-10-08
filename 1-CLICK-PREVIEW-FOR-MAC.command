#!/bin/bash
cd "$(dirname "$0")"
open "double-click-to-preview.html" || open "index.html"
(sleep 1 && open "http://localhost:8000") &
python3 -m http.server 8000 || python -m http.server 8000

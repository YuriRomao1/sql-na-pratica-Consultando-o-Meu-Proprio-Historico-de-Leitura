#!/usr/bin/env bash
set -euo pipefail

DATABASE=".data/livros.db"

mkdir -p .data
rm -f "$DATABASE"

sqlite3 "$DATABASE" < database/schema.sql
sqlite3 "$DATABASE" < database/seed.sql

echo "Banco recriado em $DATABASE"
echo "Execute: sqlite3 -header -column $DATABASE"

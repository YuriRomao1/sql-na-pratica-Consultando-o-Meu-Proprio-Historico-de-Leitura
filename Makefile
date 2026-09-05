DATABASE=.data/livros.db

setup:
	bash scripts/reset-database.sh

reset:
	bash scripts/reset-database.sh

db:
	sqlite3 -header -column $(DATABASE)

test-01:
	bash tests/test-01.sh

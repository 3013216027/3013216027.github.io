deploy: .push

.push: index.html
	@git add .
	@git commit -m 'update index' || true
	@git pull --rebase
	@git push
	@scp -P 29997 index.html dong@104.223.111.171:/var/www/html

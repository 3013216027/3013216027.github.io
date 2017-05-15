deploy: .push

.push: index.html
	@git add .
	@git commit -m 'update index' || true
	@git pull --rebase
	@git push
	@scp -P 29997 index.html dong@qyetfu.site:/var/www/html

deploy: .push

.push: index.html
	@git add .
	@git commit -m 'update index'
	@git pull --rebase
	@git push
	@scp -P 29997 index.html dong@qyetfu.site:/var/www/html

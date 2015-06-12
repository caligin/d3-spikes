.PHONY: deps run

node_modules: package.json
	npm install

bower_components: bower.json node_modules
	node_modules/bower/bin/bower install

deps: | node_modules/ bower_components/

run:
	docker run --name d3-experiments -v $(shell readlink -f www):/usr/share/nginx/html:ro -p 5580:80 -d nginx

run-py:
	cd www && python -m SimpleHTTPServer 8000

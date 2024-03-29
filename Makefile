.PHONY:site
site:
	JEKYLL_ENV=production bundle exec jekyll build

.PHONY:serve
serve:
	JEKYLL_ENV=development bundle exec jekyll serve --verbose --watch

.PHONY:release
release: site
	cp .htaccess _site
	cd _site; rsync --delete -PaAXz . $(USER)@$(WEB_SERVER):$(ZONNIGWAASLAND_PATH)

.PHONY:ssh
ssh:
	ssh $(USER)@$(WEB_SERVER)

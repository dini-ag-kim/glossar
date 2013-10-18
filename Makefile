# Usage:
#   make html
#   make gh-pages

html: glossar.html

gh-pages: glossar.html
	mv glossar.html glossar.html.tmp
	git checkout gh-pages || ( git checkout --orphan gh-pages && git rm -rf . )
	mv glossar.html.tmp glossar.html
	git add glossar.html
	git commit -m "updated HTML"
	git checkout master

.SUFFIXES: .md .html

.md.html:
	cat $< | perl -pe 's/(\[[^\]]+\]\(#\w+\))/↗ $$1/g' > $<.tmp
	pandoc $<.tmp -f markdown -t html5 -o $@ -s --smart
	perl -i -pe 's/“(\w([^”]*\w)?)”/„$$1“/g;s/‘(\w([^’]*\w)?)’/‚$$1‘/g' $@


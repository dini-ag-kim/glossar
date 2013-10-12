.SUFFIXES: .md .html

.md.html:
	cat $< | perl -pe 's/(\[[^\]]+\]\(#\w+\))/↗ $$1/g' > $<.tmp
	pandoc $<.tmp -f markdown -t html5 -o $@ -s --smart
	perl -i -pe 's/“(\w([^”]*\w)?)”/„$$1“/g;s/‘(\w([^’]*\w)?)’/‚$$1‘/g' $@

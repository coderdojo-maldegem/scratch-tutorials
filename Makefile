MD_FILES=$(wildcard */*/*.md)
MD_FILES+=$(wildcard */*.md)

all: $(patsubst %.md, %.html, $(MD_FILES))

%.html: %.md head.html
	$(info Running markdown_py on $< $@)
	@cp -f head.html $@
	@printf '\n  %s%s%s%s' '<time datetime="' `date +%U` '">' `date +%F` '</time>' >> $@
	@markdown_py -e UTF-8 -x fenced_code -x codehilite $< >> $@
	@sed -i '$$s/<p>\(.*\)<\/p>/\1/g;$$i\<footer\>' $@
	@cat tail.html >> $@

MD_FILES=$(wildcard */*/*.md)
MD_FILES+=$(wildcard */*.md)
flappybat/* : GRAAD=basis
pong/* dodgeball/* : GRAAD=ervaren
galgje/* memory/* klok/* : GRAAD=gevorderd

all: $(patsubst %.md, %.html, $(MD_FILES))

%.html: %.md head.html tail.html
	$(info Running markdown_py on $< $@)
	@cp -f head.html $@
	@markdown_py -e UTF-8 $< >> $@
	$(if $(findstring index.md,$<),@sed -f index.sed -i $@)
	@sed -i 's/<body>/<body class="${GRAAD}">/' $@
	@sed -i '$$s/<p>\(.*\)<\/p>/\1/g;$$i\<\/main\>\<footer\>' $@
	@cat tail.html >> $@

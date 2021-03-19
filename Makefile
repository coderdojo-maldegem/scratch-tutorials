SOURCE=src/
TARGET=public/
MD_FILES=$(wildcard $(SOURCE)**/*.md)
GEVORDERD=pong dodgeball
EXPERT=simon galgje memory klok

GRAAD=starter
$(patsubst %, $(TARGET)%/*, $(GEVORDERD)) : GRAAD=gevorderd
$(patsubst %, $(TARGET)%/*, $(EXPERT)) : GRAAD=expert

all: $(patsubst $(SOURCE)%.md, $(TARGET)%.html, $(MD_FILES))

$(TARGET)%.html: $(SOURCE)%.md $(SOURCE)head.html $(SOURCE)tail.html
	$(info Running markdown_py on $< $@)
	@mkdir -p $(dir $@)
	@cp -f $(SOURCE)head.html $@
	@markdown_py -e UTF-8 -x fenced_code -x markdown_checklist.extension $< >> $@
	$(if $(findstring index.md,$<),@sed -f $(SOURCE)index.sed -i $@)
	@sed -i 's/<body>/<body class="${GRAAD}">/' $@
	@sed -i '$$s/<p>\(.*\)<\/p>/\1/g;$$i\<\/main\>\<footer\>' $@
	@cat $(SOURCE)tail.html >> $@

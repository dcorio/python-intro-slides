# source file path without suffix
NAME=index
THEME=python
#THEME=default2

all:
	python rst-directive.py \
		--stylesheet=pygments.css \
		--theme-url=ui/${THEME} \
		${NAME}.rst > ${NAME}.html

# SRC_DIR = ./body
# SRC = $(wildcard $(SRC_DIR)/*.tex)
SRC = $(shell find ./ -regextype 'posix-egrep' -regex '.*\.tex')
LOG = $(shell find ./ -regextype 'posix-egrep' -regex '.*\.(aux|log|auto|toc|out)')


default: main.pdf Makefile

main.pdf: main.tex ${SRC}
	xelatex -shell-escape main.tex && xelatex -shell-escape main.tex

build:
	make clean
	make main.pdf

clean:
	rm -r $(LOG)

view: main.pdf
	evince main.pdf

NAME = eiais/jenkinsworld
VERSION = latest

all: build

build: 
	@docker build . -t $(NAME)\:$(VERSION)

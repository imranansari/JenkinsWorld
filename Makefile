NAME = eiaisjenkins/jenkinsworld
VERSION = latest

all: build

build: 
	@docker build . -t $(NAME)\:$(VERSION)

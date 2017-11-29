NAME = library/elasticsearch-clustered
REGISTRY = registry.abarcloud.com
MAJOR_VERSION = 5
MINOR_VERSION = 5.6.3

.PHONY: all build tag release

all: build

build:
	docker build -t $(NAME):$(MINOR_VERSION) $(MINOR_VERSION)

tag:
	docker tag $(NAME):$(MINOR_VERSION) $(REGISTRY)/$(NAME):latest
	docker tag $(NAME):$(MINOR_VERSION) $(REGISTRY)/$(NAME):$(MAJOR_VERSION)
	docker tag $(NAME):$(MINOR_VERSION) $(REGISTRY)/$(NAME):$(MINOR_VERSION)

release: build tag
	docker push $(REGISTRY)/$(NAME):latest
	docker push $(REGISTRY)/$(NAME):$(MAJOR_VERSION)
	docker push $(REGISTRY)/$(NAME):$(MINOR_VERSION)

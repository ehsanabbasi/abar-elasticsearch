## AbarCloud ElasticSearch

This modifies the [base ElasticSearch docker image](https://github.com/elastic/elasticsearch-docker) to enable clustering on AbarCloud. See the [AbarCloud docs](https://docs.abarcloud.com/additional-services/elasticsearch.html) for usage instructions.

## Building images

You can build all images using:
```
make build
```

## Releasing new images

You can release all images to DockerHub using:
```
make release
```

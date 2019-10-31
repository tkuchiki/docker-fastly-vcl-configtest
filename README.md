# docker-fastly-vcl-configtest
Fastly VCL configtest docker image

[![Docker Pulls](https://img.shields.io/docker/pulls/tkuchiki/fvcl-configtest.svg?style=for-the-badge)](https://hub.docker.com/r/tkuchiki/fvcl-configtest/)

```shell
$ docker run -v $(pwd)/your.vcl:/path/to/your.vcl -t tkuchiki/varnish215 -C -f /path/to/your.vcl
```


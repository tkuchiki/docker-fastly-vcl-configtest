# docker-fastly-vcl-configtest

**This is an experimental project.**

Fastly VCL configtest docker image.


[![Docker Pulls](https://img.shields.io/docker/pulls/tkuchiki/fvcl-configtest.svg?style=for-the-badge)](https://hub.docker.com/r/tkuchiki/fvcl-configtest/)

```shell
$ docker run -v $(pwd)/your.vcl:/path/to/your.vcl -t tkuchiki/fvcl-configtest -C -f /path/to/your.vcl
```


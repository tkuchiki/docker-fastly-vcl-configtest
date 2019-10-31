FROM ubuntu:18.04

WORKDIR /tmp
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y curl tar autotools-dev automake libtool autoconf libncurses5-dev xsltproc groff-base libpcre3-dev pkg-config python-docutils subversion tzdata tcl
RUN curl -LO https://github.com/varnishcache/varnish-cache/archive/varnish-2.1.5.tar.gz && tar zxf varnish-2.1.5.tar.gz

WORKDIR /tmp/varnish-cache-varnish-2.1.5/
RUN sed -i -e 's/INCLUDES/AM_CPPFLAGS/g' lib/*/Makefile.am bin/*/Makefile.am
RUN sed -ie '4d' bin/varnishtest/Makefile.am

COPY bin/varnishd/cache_vrt.c           bin/varnishd/cache_vrt.c
COPY include/vrt.h                      include/vrt.h
COPY lib/libvcl/vcc_gen_fixed_token.tcl lib/libvcl/vcc_gen_fixed_token.tcl
COPY lib/libvcl/vcc_acl.c               lib/libvcl/vcc_acl.c
COPY lib/libvcl/vcc_backend.c           lib/libvcl/vcc_backend.c
COPY lib/libvcl/vcc_compile.c           lib/libvcl/vcc_compile.c
COPY lib/libvcl/vcc_compile.h           lib/libvcl/vcc_compile.h
COPY lib/libvcl/vcc_dir_random.c        lib/libvcl/vcc_dir_random.c
COPY lib/libvcl/vcc_parse.c             lib/libvcl/vcc_parse.c
COPY lib/libvcl/vcc_string.c            lib/libvcl/vcc_string.c

RUN cd lib/libvcl && tclsh vcc_gen_fixed_token.tcl
RUN sh autogen.sh || true
RUN sh configure && make && make install
RUN ldconfig

ENTRYPOINT ["/usr/local/sbin/varnishd"]

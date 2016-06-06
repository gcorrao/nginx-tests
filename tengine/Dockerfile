FROM ubuntu:latest

RUN apt-get --yes update
RUN apt-get --yes install wget build-essential libpcre3 libpcre3-dev libssl-dev git-core make curl libssl-dev libssl-dev libossp-uuid-dev lua5.1 liblua5.1-0 liblua5.1-0-dev
RUN mkdir -p /usr/src
RUN cd /tmp && curl -O "https://codeload.github.com/alibaba/tengine/tar.gz/tengine-2.1.2_f" && tar -xzf tengine-2.1.2_f && mv tengine-tengine-2.1.2_f tengine
RUN cd /tmp/tengine/modules && git clone https://github.com/agentzh/echo-nginx-module.git && cd echo-nginx-module && git checkout v0.45
RUN cd /tmp/tengine/modules && git clone https://github.com/agentzh/array-var-nginx-module.git && cd array-var-nginx-module && git checkout v0.03rc1
RUN cd /tmp/tengine/modules && git clone https://github.com/agentzh/set-misc-nginx-module.git && cd set-misc-nginx-module && git checkout v0.22rc8
RUN cd /tmp/tengine/modules && git clone https://github.com/agentzh/headers-more-nginx-module.git && cd headers-more-nginx-module && git checkout v0.20
RUN cd /tmp/tengine/modules && git clone https://github.com/xetorthio/nginx-upstream-idempotent.git && cd nginx-upstream-idempotent && git checkout e4f72f7ffea2d50c896c
RUN cd /tmp/tengine/modules && git clone https://github.com/simpl/ngx_devel_kit.git && cd ngx_devel_kit && git checkout v0.2.18
RUN cd /tmp/tengine/modules && git clone https://github.com/newobj/nginx-x-rid-header.git
RUN cd /tmp/tengine && ./configure --prefix=/usr/local/nginx --with-ld-opt="-lossp-uuid" --with-cc-opt="-I/usr/include/ossp" --with-http_stub_status_module \
--add-module=/tmp/tengine/modules/echo-nginx-module \
--add-module=/tmp/tengine/modules/ngx_devel_kit \
--add-module=/tmp/tengine/modules/array-var-nginx-module \
--add-module=/tmp/tengine/modules/set-misc-nginx-module \
--add-module=/tmp/tengine/modules/nginx-upstream-idempotent \
--add-module=/tmp/tengine/modules/headers-more-nginx-module \
--add-module=/tmp/tengine/modules/nginx-x-rid-header && make && make install
EXPOSE 80
CMD ["/bin/bash"]

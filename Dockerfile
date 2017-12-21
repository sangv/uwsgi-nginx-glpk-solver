FROM tiangolo/uwsgi-nginx:python3.5

MAINTAINER Sang Venkatraman <sang.venkatraman@gmail.com>

WORKDIR /usr/local/
RUN wget http://ftp.gnu.org/gnu/glpk/glpk-4.61.tar.gz \
	&& tar -zxvf glpk-4.61.tar.gz


WORKDIR /usr/local/glpk-4.61
RUN ./configure \
	&& make \
	&& make check \
	&& make install \
	&& make distclean \
	&& ldconfig \
# Cleanup
	&& rm -rf /usr/local/glpk-4.61.tar.gz \
	&& apt-get clean


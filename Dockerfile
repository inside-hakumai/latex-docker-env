FROM frolvlad/alpine-glibc:latest

LABEL MAINTAINER=inside-hakumai

ENV PATH=/usr/local/texlive/2018/bin/x86_64-linuxmusl:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN /bin/sh -c apk --no-cache add perl wget xz tar fontconfig-dev freetype-dev \
    && mkdir /tmp/install-tl-unx \
    && wget -qO - ftp://tug.org/historic/systems/texlive/2018/install-tl-unx.tar.gz | tar -xz -C /tmp/install-tl-unx --strip-components=1 \
    && printf "%s\n" "selected_scheme scheme-basic" "option_doc 0" "option_src 0" > /tmp/install-tl-unx/texlive.profile \
    && /tmp/install-tl-unx/install-tl --profile=/tmp/install-tl-unx/texlive.profile \
    && tlmgr install collection-basic collection-latex collection-latexrecommended collection-latexextra collection-fontsrecommended collection-langjapanese latexmk xetex \
    && rm -fr /tmp/install-tl-unx \
    && apk --no-cache del xz tar

RUN /bin/sh -c apk --no-cache add bash make
RUN /bin/sh -c mkdir /workdir

WORKDIR /workdir

VOLUME [/workdir]

CMD ["bash"]
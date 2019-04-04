FROM paperist/alpine-texlive-ja:latest

LABEL MAINTAINER=inside-hakumai

# ipaex-type1 パッケージの導入
RUN /bin/sh -c 'wget -O /tmp/ipaex-type1.zip http://mirrors.ctan.org/fonts/ipaex-type1.zip \
    && unzip /tmp/ipaex-type1.zip -d /tmp \ 
    && mkdir /usr/local/texlive/2018/texmf-dist/fonts/tfm/public/ipaex-type1 \
    && mkdir /usr/local/texlive/2018/texmf-dist/fonts/type1/public/ipaex-type1 \
    && mkdir /usr/local/texlive/2018/texmf-dist/fonts/enc/dvips/ipaex-type1 \
    && mkdir /usr/local/texlive/2018/texmf-dist/fonts/map/dvips/ipaex-type1 \
    && mkdir /usr/local/texlive/2018/texmf-dist/tex/latex/ipaex-type1 \
    && cp /tmp/ipaex-type1/tfm/*.tfm /usr/local/texlive/2018/texmf-dist/fonts/tfm/public/ipaex-type1/ \
    && cp /tmp/ipaex-type1/type1/*.pfb /usr/local/texlive/2018/texmf-dist/fonts/type1/public/ipaex-type1/ \
    && cp /tmp/ipaex-type1/enc/*.enc /usr/local/texlive/2018/texmf-dist/fonts/enc/dvips/ipaex-type1/ \
    && cp /tmp/ipaex-type1/ipaex-type1.map /usr/local/texlive/2018/texmf-dist/fonts/map/dvips/ipaex-type1/ \
    && cp /tmp/ipaex-type1/*.sty /usr/local/texlive/2018/texmf-dist/tex/latex/ipaex-type1/ \
    && cp /tmp/ipaex-type1/*.fd /usr/local/texlive/2018/texmf-dist/tex/latex/ipaex-type1/ \
    && cp /tmp/ipaex-type1/*.fdx /usr/local/texlive/2018/texmf-dist/tex/latex/ipaex-type1/ \
    && cd /usr/local/texlive/2018/texmf-dist/tex/latex/ipaex-type1; mktexlsr \
    && updmap --enable Map ipaex-type1.map -sys'

# algorithmic / algorithm パッケージの導入
RUN /bin/sh -c 'wget -O /tmp/algorithms.zip http://mirrors.ctan.org/macros/latex/contrib/algorithms.zip \
    && unzip /tmp/algorithms.zip -d /tmp \
    && cd /tmp/algorithms; latex algorithms.ins \
    && mkdir /usr/local/texlive/2018/texmf-dist/tex/platex/algorithms \
    && cp /tmp/algorithms/algorithm.sty /usr/local/texlive/2018/texmf-dist/tex/platex/algorithms/ \
    && cp /tmp/algorithms/algorithmic.sty /usr/local/texlive/2018/texmf-dist/tex/platex/algorithms/ \
    && cd /usr/local/texlive/2018/texmf-dist/tex/platex/algorithms; mktexlsr'

RUN /bin/sh -c 'apk --no-cache add bash make'

WORKDIR /workdir

VOLUME [/workdir]

CMD ["bash"]
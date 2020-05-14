FROM ubuntu:18.04

COPY . /root/

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

WORKDIR /root

RUN apt-get update
RUN apt-get install -y gosu git ffmpeg
RUN apt-get install -y python3 python3-pip \
    && pip3 install --upgrade pip

RUN apt-get install -y xvfb curl libnss3-dev libgtk-3-0
RUN curl -LO https://github.com/plotly/orca/releases/download/v1.3.1/orca-1.3.1.AppImage
RUN chmod +x /root/orca-1.3.1.AppImage
RUN chmod +x /root/orca
RUN ln -s /root/orca /usr/local/bin/orca
RUN which orca
RUN orca --help

RUN pip3 install --progress-bar=off -r requirements.txt
RUN git clone https://github.com/kaizu/ecell4_docs.git \
    && cd ecell4_docs \
    && git checkout -b gallery origin/gallery \
    && pip3 install --progress-bar=off -r en/requirements.txt

ENTRYPOINT ["sh", "-ex", "entrypoint.sh"]

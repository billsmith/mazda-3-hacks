FROM ubuntu:16.04
COPY MZD-AIO-TI-linux_2.8.1.deb /MZD-AIO-TI-linux_2.8.1.deb
RUN apt-get update
RUN dpkg -i /MZD-AIO-TI-linux_2.8.1.deb || true
RUN apt-get install -f -y
RUN dpkg -i /MZD-AIO-TI-linux_2.8.1.deb
RUN apt-get install -y libasound2


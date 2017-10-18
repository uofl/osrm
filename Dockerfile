FROM ubuntu:16.04

RUN mkdir /code
COPY v5.12.0-rc.1.zip /code
RUN apt-get update 
RUN apt-get -y install build-essential git cmake pkg-config \
libbz2-dev libstxxl-dev libstxxl1v5 libxml2-dev \
libzip-dev libboost-all-dev lua5.2 liblua5.2-dev libtbb-dev  gzip unzip 
RUN unzip /code/v5.12.0-rc.1.zip -d /code
RUN mkdir -p build
WORKDIR /code/osrm-backend-5.12.0-rc.1/build
RUN  cmake ..
RUN  cmake --build .
RUN  cmake --build . --target install
EXPOSE 5000

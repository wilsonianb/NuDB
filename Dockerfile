FROM ubuntu:15.10

RUN apt-get update
RUN apt-get -y install gcc git python-software-properties curl scons ctags pkg-config protobuf-compiler libprotobuf-dev libssl-dev python-software-properties libboost-all-dev nodejs
RUN apt-get update
RUN apt-get -y install cmake
RUN apt-get -y install gdb
RUN apt-get -y install zlib1g
RUN apt-get -y install libsnappy-dev
RUN apt-get -y install libboost1.58-tools-dev
RUN apt-get -y install wget
RUN apt-get -y install g++-multilib
RUN apt-get -y install subversion
RUN apt-get -y install automake

RUN mkdir -p scripts
COPY scripts/ scripts/

#RUN ADDRESS_MODEL=32 BOOST_ROOT=$HOME/boost_1_60_0 BOOST_URL='http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.60.0%2Fboost_1_60_0.tar.gz&ts=1460417589&use_mirror=netix' LCOV_ROOT=$HOME/lcov VALGRIND_ROOT=$HOME/valgrind-install scripts/install-dependencies.sh

#NuDB
CMD which bjam && cd /opt/NuDB && scripts/build-and-test.sh

#Benchmark
#CMD mkdir -p /opt/NuDB/bench_build && cd /opt/NuDB/bench_build && cmake -DCMAKE_BUILD_TYPE=Release ../benchmark && make && ./benchmark

# docker build -t nudb .
# docker run -v /home/bwilson/NuDB:/opt/NuDB -e "BOOST_ROOT=" -e "BUILD_SYSTEM=cmake" nudb

# docker run -v /home/bwilson/NuDB:/opt/NuDB -e "ADDRESS_MODEL=32" -e "BOOST_ROOT=$HOME/boost_1_60_0 BOOST_URL='http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.60.0%2Fboost_1_60_0.tar.gz&ts=1460417589&use_mirror=netix" nudb


# docker run -v /home/bwilson/NuDB:/opt/NuDB nudb /opt/NuDB/bin/debug/bench > /opt/NuDB/benchresults
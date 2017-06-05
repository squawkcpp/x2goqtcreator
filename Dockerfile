# Dockerfile to install qtcreator and x2goxfce
FROM spielhuus/x2goxfce

ENV QT_URI="http://download.qt.io/official_releases/qt/5.9/5.9.0"
ENV QT_VERSION="5.9.0"

RUN apt-get -y update && apt-get install -y \
	clang make gdb git cmake ninja-build graphviz mscgen doxygen astyle cppcheck \
        valgrind valkyrie
#	 wireshark sqlite sqlitebrowser \
#	\
#	libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavresample-dev libavcodec-extra \
#	libsdl2-dev libboost-all-dev libao-dev libimlib2-dev libsqlite3-dev libxml++-dev libpcre++-dev \
#	libimlib2-dev libxml2-dev libv8-dev libmp3lame-dev libflac++-dev libpoppler-cpp-dev \
#	libcurl4-openssl-dev libcurlpp-dev libboost-all-dev libpoppler-cpp-dev libzmq-dev libsigc++-2.0-dev \
#	libssl-dev libarchive-dev uuid-dev

ADD qt-installer-noninteractive.qs /
RUN wget "$QT_URI/qt-opensource-linux-x64-$QT_VERSION.run" \
&& chmod a+x qt-opensource-linux-x64-$QT_VERSION.run \
&& ./qt-opensource-linux-x64-$QT_VERSION.run --platform minimal --silent --script /qt-installer-noninteractive.qs \
&& rm qt-opensource-linux-x64-$QT_VERSION.run /qt-installer-noninteractive.qs \
&& ln -s /Qt/Tools/QtCreator/bin/qtcreator /qtcreator

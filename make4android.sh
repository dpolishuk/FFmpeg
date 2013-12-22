#!/bin/bash

make -j6 && make install
rm libavcodec/inverse.o
rm libavcodec/log2_tab.o
rm libavformat/log2_tab.o
rm libswresample/log2_tab.o
$CC -lm -lz -llog -shared --sysroot=$SYSROOT \
-Wl,--no-undefined -Wl,-z,noexecstack $EXTRA_LDFLAGS \
libavutil/*.o \
libavutil/arm/*.o \
libavcodec/*.o \
libavcodec/arm/*.o \
libavformat/*.o \
libswresample/*.o \
libswscale/*.o \
-o libffmpeg.so \
&& arm-linux-androideabi-strip libffmpeg.so

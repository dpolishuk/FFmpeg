#!/bin/bash

export PATH=$TOOLCHAIN/bin:$PATH
export CC=arm-linux-androideabi-gcc
export LD=arm-linux-androideabi-ld
export AR=arm-linux-androideabi-ar

CFLAGS="-DHAVE_ANDROID -llog -O3 -Wall \
  -DANDROID -DNDEBUG -pipe -mthumb -fpic -fasm \
  -finline-limit=300 -ffast-math \
  -fstrict-aliasing -Werror=strict-aliasing \
  -fmodulo-sched -fmodulo-sched-allow-regmoves \
  -Wno-psabi -Wa,--noexecstack"

EXTRA_CFLAGS="-march=armv7-a -mfpu=neon -mfloat-abi=softfp -mvectorize-with-neon-quad"
EXTRA_LDFLAGS="-Wl,--fix-cortex-a8 -llog"

FFMPEG_FLAGS="--prefix=/tmp/ffmpeg/build \
  --target-os=linux \
  --arch=arm \
  --enable-cross-compile \
  --cross-prefix=arm-linux-androideabi- \
  --enable-shared \
  --disable-symver \
  --disable-doc \
  --disable-ffplay \
  --disable-ffmpeg \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-avdevice \
  --disable-avfilter \
  --disable-encoders  \
  --disable-muxers \
  --disable-filters \
  --disable-devices \
  --disable-everything \
  --enable-protocol=http \
  --enable-protocol=httpproxy \
  --enable-protocol=https \
  --enable-protocol=file \
  --enable-parser=aac \
  --enable-parser=aac_latm \
  --enable-parser=ac3 \
  --enable-parser=h264 \
  --enable-parser=mpeg4video \
  --enable-parser=mpegaudio \
  --enable-parser=mpegvideo \
  --enable-demuxers \
  --disable-demuxer=sbg \
  --enable-decoder=aac \
  --enable-decoder=aac_latm \
  --enable-decoder=ac3 \
  --enable-decoder=mpeg2_crystalhd \
  --enable-decoder=mpeg2video \
  --enable-decoder=mpeg4_crystalhd \
  --enable-decoder=mpeg4 \
  --enable-decoder=mpegvideo \
  --enable-decoder=h264_crystalhd \
  --enable-decoder=h264 \
  --enable-bsf=h264_mp4toannexb \
  --enable-bsf=aac_adtstoasc \
  --enable-network \
  --disable-swscale  \
  --enable-asm \
  --enable-version3"

./configure $FFMPEG_FLAGS --extra-cflags="$CFLAGS $EXTRA_CFLAGS" --extra-ldflags="$EXTRA_LDFLAGS"

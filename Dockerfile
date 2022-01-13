FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-runtime
MAINTAINER jincheng <jincheng.jcs@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /det

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean

RUN apt-get update -q &&\
    apt-get upgrade -yq

RUN apt install -yq git
RUN apt install -yq cmake build-essential
RUN apt-get install -yq \
    # for OpenGL
    libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev libxi-dev
RUN apt-get install -yq \
    # for OpenCV
    checkinstall gfortran libjpeg8-dev libtiff5-dev libavcodec-dev libavformat-dev \
    libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev \
    qt5-default libgtk2.0-dev libtbb-dev libatlas-base-dev \
    libfaac-dev libmp3lame-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev \
    libopencore-amrwb-dev x264 v4l-utils libprotobuf-dev protobuf-compiler libgoogle-glog-dev \
    libgflags-dev libgphoto2-dev libeigen3-dev libhdf5-dev doxygen \
    # for ffmpeg
    ffmpeg

RUN rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ppogg/YOLOv5-Lite.git
RUN cd YOLOv5-Lite && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

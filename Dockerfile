FROM ubuntu:20.04
  RUN apt-get -y update 
  ENV DEBIAN_FRONTEND=noninteractive  
  RUN apt install -y wget python3-pip git ffmpeg openvpn
  RUN apt install -y libsm6 libxext6 
  RUN apt --fix-broken install
  ENV DEBIAN_FRONTEND=noninteractive
  RUN pip install paddlepaddle==2.5.1
  RUN pip install git+https://github.com/oliverfei/videocr-PaddleOCR.git
  RUN wget https://github.com/devmaxxing/videocr-PaddleOCR/raw/refs/heads/master/example.py
  RUN wget https://github.com/devmaxxing/videocr-PaddleOCR/raw/refs/heads/master/example_cropped.mp4
  RUN python3 example.py
  RUN rm -fr example.py example_cropped.mp4 example.srt

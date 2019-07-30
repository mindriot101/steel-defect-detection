FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsm6 \
    libxext6 \
    git \
    libxrender-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -U pip

RUN pip install \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    opencv-python \
    pillow \
    cython \
    scikit-image \
    h5py \
    imgaug \
    keras \
    scipy

RUN useradd -G sudo -m simon

RUN git clone https://github.com/matterport/Mask_RCNN /mask-rcnn-src && \
    cd /mask-rcnn-src && git checkout 3deaec5d902d16e1daf56b62d5971d428dc920bc && \
    sed -i "s/name='mask-rcnn'/name='mrcnn'/" setup.py && \
    pip install /mask-rcnn-src

RUN curl -Lo /mask-rcnn-src/mask_rcnn_coco.h5 https://github.com/matterport/Mask_RCNN/releases/download/v2.0/mask_rcnn_coco.h5

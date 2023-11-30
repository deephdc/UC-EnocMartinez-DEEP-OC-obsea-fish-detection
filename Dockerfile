# Dockerfile may have following Arguments:
# tag - tag for the Base image, (e.g. 2.9.1 for tensorflow)
#
# To build the image:
# $ docker build -t <dockerhub_user>/<dockerhub_repo> --build-arg arg=value .
# or using default args:
# $ docker build -t <dockerhub_user>/<dockerhub_repo> .
#
# [!] Note: For the Jenkins CI/CD pipeline, input args are defined inside the
# Jenkinsfile, not here!

ARG tag=cpu

# Base image, e.g. tensorflow/tensorflow:2.9.1
FROM deephdc/deep-oc-yolov8_api:${tag}

# Download model from provisional server

LABEL maintainer='Enoc Martínez, Oriol Prat Bayarri, Pol Baños Castelló'
LABEL version='0.0.1'
# AI-based fish detection and classification algorithm based on YOLOv8. The model has been finetuned to detect and classify fish at the OBSEA underwater observatory.

# Download new model weights and remove old ones
# Download model from provisional server

RUN mkdir -p /srv/yolov8_api/models/yolov8_obsea_xlarge/weights && \
    curl -L https://github.com/EnocMartinez/obsea-fish-detection/releases/download/model/12sp_1537img_xlarge_lr_0_000375_1920_best.pt \
    --output /srv/yolov8_api/models/yolov8_obsea_xlarge/weights/best.pt && \
    mkdir -p /srv/yolov8_api/models/yolov8_obsea_nano/weights && \
    curl -L https://github.com/EnocMartinez/obsea-fish-detection/releases/download/model/12sp_1537img_nano_lr_0_000375_1920_best.pt \
    --output /srv/yolov8_api/models/yolov8_obsea_nano/weights/best.pt



# You can use the following as "reference" - https://github.com/deephdc/DEEP-OC-phytoplankton-classification-tf/blob/master/Dockerfile
###############
### FILL ME ###
###############

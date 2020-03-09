ARG SWIFT_VERSION=5.1.4
FROM fabianfett/amazonlinux-swift:$SWIFT_VERSION-amazonlinux2

# needed to do again after FROM due to docker limitation
ARG SWIFT_VERSION

RUN yum -y update && \
  yum -y install zlib-devel kernel-devel gcc-c++ openssl-devel

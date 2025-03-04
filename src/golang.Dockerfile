# Dockerfile
#
# Go language basic build environment
#
# @author      Nicola Asuni <info@tecnick.com>
# @copyright   2016-2022 Nicola Asuni - Tecnick.com LTD
# @license     MIT (see LICENSE)
# @link        https://github.com/tecnickcom/alldev
# ------------------------------------------------------------------------------
ARG GO_VERSION="1.19"
FROM golang:${GO_VERSION}
ENV PATH=/root/.local/bin:$PATH
ENV USER=root
RUN apt update \
&& apt -y install \
alien \
debhelper \
devscripts \
dh-golang \
dh-make \
fakeroot \
pkg-config \
python3-all-dev \
python3-pip \
rpm \
sudo \
upx-ucl \
&& pip install --upgrade \
jsonschema \
yamllint \
&& go install github.com/mikefarah/yq/v4@latest \
&& go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest

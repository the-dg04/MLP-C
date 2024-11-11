#!/bin/bash
set -euxo pipefail

ADDR="https://ossci-datasets.s3.amazonaws.com/mnist"
FILES=(train-images-idx3-ubyte.gz \
       train-labels-idx1-ubyte.gz \
       t10k-images-idx3-ubyte.gz  \
       t10k-labels-idx1-ubyte.gz)
mkdir -pv data && cd data
for f in ${FILES[@]}; do
  wget -nc ${ADDR}/$f; gunzip -f $f
done
cd ..

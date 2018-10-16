#!/bin/sh

image=$1

mkdir -p test_dir/model
mkdir -p test_dir/output

# Install tensorflow and tensorboard not note book instance to run TensorBoard
pip install tensorboard
pip install tensorflow

#create a directory to expose the container logs on to notebook instance

mkdir -p /tmp/retrain_logs

rm test_dir/model/*
rm test_dir/output/*

docker run -v $(pwd)/test_dir:/opt/ml -v  /tmp/retrain_logs:/tmp/retrain_logs --rm ${image} train

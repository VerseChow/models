#!/bin/bash

set -e

# Where the checkpoint and logs will be saved to.
TRAIN_DIR=cifar10/resnet_v2_50

# Where the dataset is saved to.
DATASET_DIR=cifar10/

#python download_and_convert_data.py \
#    --dataset_name=cifar10 \
#    --dataset_dir=/tmp/cifar10

# Run training.
python train_image_classifier.py \
  --train_dir=cifar10/resnet_v2_50 \
  --dataset_name=cifar10 \
  --dataset_split_name=train \
  --dataset_dir=cifar10/ \
  --model_name=resnet_v2_50 \
  --preprocessing_name=cifarnet \
  --max_number_of_steps=100000 \
  --batch_size=128 \
  --save_interval_secs=600 \
  --save_summaries_secs=30   \
  --log_every_n_steps=100 \
  --optimizer=sgd \
  --learning_rate=0.1 \
  --learning_rate_decay_factor=0.1 \
  --num_epochs_per_decay=100 \
  --weight_decay=0.004

# Run evaluation.
python eval_image_classifier.py \
  --checkpoint_path=cifar10/resnet_v2_50 \
  --eval_dir=cifar10/resnet_v2_50 \
  --dataset_name=cifar10 \
  --dataset_split_name=test \
  --dataset_dir=cifar10/ \
  --preprocessing_name=cifarnet \
  --model_name=resnet_v2_50

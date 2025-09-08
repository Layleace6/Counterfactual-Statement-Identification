#!/usr/bin/env bash
# -*- coding:utf-8 -*-

TRAIN_DATA_FOLDER=data/train_data
EVAL_DATA_FOLDER=data/eval_data
ZIP_FOLDER=data/zip_data

mkdir -p ${TRAIN_DATA_FOLDER}/subtask1_augment
mkdir -p ${ZIP_FOLDER}


echo "Convert subtask1 data from csv to jsonl"

python data_scripts/format_converter.py \
  -src ${ZIP_FOLDER}/Augment-Dataset/subtask1_train.csv \
  -tgt ${TRAIN_DATA_FOLDER}/subtask1_augment/train.jsonl \
  -key-map "{'gold_label':'label','sentence':'text'}"

echo "Split subtask1 data"

python data_scripts/generate_subtask1_data.py \
  -data ${TRAIN_DATA_FOLDER}/subtask1_augment/train.jsonl \
  -split data/split_filelist/subtask1 \
  -output ${TRAIN_DATA_FOLDER}/subtask1_augment


echo "*************************"
echo "Subtask1 train data path: ${TRAIN_DATA_FOLDER}/subtask1"
echo "*************************"

mkdir -p ${EVAL_DATA_FOLDER}/subtask1

python data_scripts/format_converter.py \
  -src ${ZIP_FOLDER}/Augment-Dataset/subtask1_test.csv \
  -tgt ${EVAL_DATA_FOLDER}/subtask1/subtask1_test.jsonl \
  -key-map "{'gold_label':'label','sentence':'text'}"


echo "*************************"
echo "Subtask1 test data path: ${EVAL_DATA_FOLDER}/subtask1"
echo "Subtask2 test data path: ${EVAL_DATA_FOLDER}/subtask2"
echo "*************************"

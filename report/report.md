---
title: "Machine Learning in the Cloud"
author: Thomas Martin
date: 21st April 2019
output: pdf_document
---

## INM432 Big Data Coursework Part 2

https://github.com/tpgmartin/inm432_cw2

## Abstract

## Task 1 - Running with Larger Dataset

Reasons for difference?

| Dataset    | Training Set Accuracy | Test Set Accuracy |
| ---------- | --------------------- | ----------------- |
| Flowers    | 100%                  | 91.3%             |
| Coastlines | 83.3%                 | 71.3%             |

## Task 2 - Modifying Server & Cluster Configurations

Include `tensorflow-gpu` as REQUIRED_PACKAGES in `setup.py` (replace `tensorflow`)

Need to set `config.yaml` file as per https://cloud.google.com/ml-engine/docs/tensorflow/using-gpus

Run training task with `--config` option

## Task 3 - Dropout

## Task 4 - Data Augmentation

## Conclusion


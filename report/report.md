---
title: "Machine Learning in the Cloud"
author: Thomas Martin
date: 21st April 2019
output: pdf_document
---

## INM432 Big Data Coursework Part 2

https://github.com/tpgmartin/inm432_cw2

## Abstract

Metrics

* Accuracy
* Loss
* Time to train

## Task 1 - Running with Larger Dataset

Reasons for difference?

Number of samples:

* Flowers 3,670
* Coastlines 10,533

Number of classes

* Flowers 5
* Coastlines 18

| Dataset    | Training Set Accuracy | Test Set Accuracy |
| ---------- | --------------------- | ----------------- |
| Flowers    | -----                 | -----             |
| Coastlines | 84.7%                 | 72.7%             |

| Dataset    | Training Set Loss     | Test Set Loss     |
| ---------- | --------------------- | ----------------- |
| Flowers    | -----                 | -----             |
| Coastlines | 0.559                 | 0.844             |

| Dataset    | Training Set Time     | Test Set Time     |
| ---------- | --------------------- | ----------------- |
| Flowers    | -----                 | -----             |
| Coastlines | 3m 54s                | 3 m 51s           |

## Task 2 - Modifying Server & Cluster Configurations

Include `tensorflow-gpu` as REQUIRED_PACKAGES in `setup.py` (replace `tensorflow`)

Need to set `config.yaml` file as per https://cloud.google.com/ml-engine/docs/tensorflow/using-gpus

Run training task with `--config` option

| Dataset    | Training Set Accuracy | Test Set Accuracy |
| ---------- | --------------------- | ----------------- |
| Flowers    |                       |                   |
| Coastlines | 84.3%                 | 72.3%             |

## Task 3 - Dropout

Update config file with line `args: —dropout 0.5`

| Dataset    | Training Set Accuracy | Test Set Accuracy |
| ---------- | --------------------- | ----------------- |
| Flowers    |                       |                   |
| Coastlines | 84%                   | 70.3%             |

## Task 4 - Data Augmentation

## Conclusion


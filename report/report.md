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


## Overview

* Discuss model used - see notes

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
| Flowers    | 100%                  | 92.33%            |
| Coastlines | 84.67%                | 72.67%            |

| Dataset    | Training Set Loss     | Test Set Loss     |
| ---------- | --------------------- | ----------------- |
| Flowers    | 0.0054                | 0.33              |
| Coastlines | 0.5588                | 0.8442            |

| Dataset    | Training Set Time     | Test Set Time     |
| ---------- | --------------------- | ----------------- |
| Flowers    | 17m 13s               | 17m 10s           |
| Coastlines | 3m 54s                | 3m 51s            |

## Task 2 - Modifying Server & Cluster Configurations

Include `tensorflow-gpu` as REQUIRED_PACKAGES in `setup.py` (replace `tensorflow`)

Need to set `config.yaml` file as per https://cloud.google.com/ml-engine/docs/tensorflow/using-gpus

Run training task with `--config` option

| Dataset    | Training Set Accuracy | Test Set Accuracy |
| ---------- | --------------------- | ----------------- |
| Flowers    | 100%                  | 91.33%            |
| Coastlines | 79.33%                | 71.0%             |

| Dataset    | Training Set Loss     | Test Set Loss     |
| ---------- | --------------------- | ----------------- |
| Flowers    | 0.0056                | 0.3546            |
| Coastlines | 0.7011                | 0.902             |

| Dataset    | Training Set Time     | Test Set Time     |
| ---------- | --------------------- | ----------------- |
| Flowers    | 3m 48s                | 3m 45s            |
| Coastlines | 2m 52s                | 3m 25s            |

## Task 3 - Dropout

Update config file with line `args: —dropout 0.5`

| Dataset    | Training Set Accuracy | Test Set Accuracy |
| ---------- | --------------------- | ----------------- |
| Flowers    | 100%                  | 90.67%            |
| Coastlines | 81.33%                | 71.67%            |

| Dataset    | Training Set Loss     | Test Set Loss     |
| ---------- | --------------------- | ----------------- |
| Flowers    | 0.0097                | 0.3623            |
| Coastlines | 0.6233                | 0.8708            |

| Dataset    | Training Set Time     | Test Set Time     |
| ---------- | --------------------- | ----------------- |
| Flowers    | 4m 1s                 | 3m 57s            |
| Coastlines | 3m 44s                | 3m 40s            |

## Conclusion


---
title: "Machine Learning in the Cloud"
author: Thomas Martin
date: 21st April 2019
geometry: margin=2.5cm
output: pdf_document
---

## INM432 Big Data Coursework Part 2

https://github.com/tpgmartin/inm432_cw2

## Introduction

This short coursework is designed as an exercise to learn how to use the Google Cloud Platform CloudML framework for machine learning tasks. The coursework is split into three main tasks,

* Running the provided source code using CloudML
* Modifying the original source code to run with a custom GPU configuration
* Exploring the effect of dropout to training

The data examined in this coursework are from a [flowers](https://github.com/GoogleCloudPlatform/cloudml-samples/tree/master/flowers) and [coastlines](https://codelabs.developers.google.com/codelabs/scd-coastline/index.html?index=..%2F..cloud-quest-scientific-data#0) dataset. Both datasets contain image files with classes. However, the number of rows is much larger in the coastlines dataset compared to the flowers dataset: 10,533 individual rows to 3,670 respectively. The number of classes also differs between the two datasets: The coastlines dataset contains 18 classes, compared to 5 in the flowers dataset.

To compare between the model performance on the two datasets, and between different configurations of the model, the following metrics will be considered,

* Accuracy - this is the proportion of true positives out of the total number of predictions for a given dataset
* Loss - this is calculated using Softmax function on the output layer
* Compute time - this is taken as relative time of each training/testing interval

Results for each task of the coursework are reproduced in tables below, as well as original files and downloads in the linked repo.

## Approach

For each dataset and configuration, the Inception v3 model was used. In this approach, only the final layers are retrained for each novel configuration.

Test train split

Preprocessing etc.

## Task 1 - Running with Larger Dataset

In the repo `inm432_cw2`, the script run for each dataset can be found at `./coastlines/sample.sh` and `./flowers/sample.sh` for the coastlines and flowers dataset respectively. The full results are reproduced in the tables below.

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

Accuracy and loss are consistently higher for the flowers dataset compared to the coastlines data. This may likely be a consequence of the much larger number of classes in the coastlines dataset compared to the flowers dataset, although it may also suggest that the former dataset is simply more difficult to classify. In either case the model indicates that ... 

It's likely that the compute time for the flowers dataset is erroneous for this specific run as all other runs are around the four minute mark.

## Task 2 - Modifying Server & Cluster Configurations

For this task a config file was passed as a command line argument to the ml-engine task, following this [guide](https://cloud.google.com/ml-engine/docs/tensorflow/using-gpus). Both datasets use the same config file.

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

In both cases we observe a slight speedup in compute time, and slight decrease in overall accuracy.

Why?

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


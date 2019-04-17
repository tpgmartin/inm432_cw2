#!/bin/bash

declare -r PROJECT=$(gcloud config list project --format "value(core.project)")
declare -r JOB_ID="coastlines_${USER}_$(date +%Y%m%d_%H%M%S)"
declare -r BUCKET="gs://${PROJECT}-ml"
declare -r GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
declare -r DICT_FILE=gs://tamucc_coastline/dict.txt

declare -r MODEL_NAME=coastlines
declare -r VERSION_NAME=v1

echo
echo "Using job id: " $JOB_ID
set -v -e

python trainer/preprocess.py \
  --input_dict "$DICT_FILE" \
  --input_path "${GCS_PATH}/eval_set.csv" \
  --output_path "${GCS_PATH}/preproc/eval" \
  --cloud

python trainer/preprocess.py \
  --input_dict "$DICT_FILE" \
  --input_path "${GCS_PATH}/train_set.csv" \
  --output_path "${GCS_PATH}/preproc/train" \
  --cloud

gcloud ml-engine jobs submit training "$JOB_ID" \
  --stream-logs \
  --module-name trainer.task \
  --package-path trainer \
  --staging-bucket "$BUCKET" \
  --region us-central1 \
  --runtime-version=1.10 \
  -- \
  --output_path "${GCS_PATH}/training" \
  --eval_data_paths "${GCS_PATH}/preproc/eval*" \
  --train_data_paths "${GCS_PATH}/preproc/train*"
  --label_count=18

gcloud ml-engine models create "$MODEL_NAME" \
  --regions us-central1

gcloud ml-engine versions create "$VERSION_NAME" \
  --model "$MODEL_NAME" \
  --origin "${GCS_PATH}/training/model" \
  --runtime-version=1.10

gcloud ml-engine versions set-default "$VERSION_NAME" --model "$MODEL_NAME"

gcloud ml-engine versions delete $VERSION_NAME --model=$MODEL_NAME -q --verbosity none
gcloud ml-engine models delete $MODEL_NAME -q --verbosity none

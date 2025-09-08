# ISCAS-SemEval2020Task5

- Code for [``ISCAS at SemEval-2020 Task 5: Pre-trained Transformers for Counterfactual Statement Modeling``](https://luyaojie.github.io/pdf/lusemeval2020.pdf)
- Please contact [Yaojie Lu](http://luyaojie.github.io) ([@luyaojie](mailto:yaojie.lu@outlook.com)) for questions and suggestions.

## Requirements

General

- Python (verified on 3.7.)
- unzip (for running data_preprocessing.sh only)

Python Packages

- allennlp==0.9.0
- transformers==2.4.1
- sklearn

```shell
conda create -n iscas-se python=3.7
conda activate iscas-se
pip install -r requirements.txt
```

## Pre-processing

First, prepare data, and preprocess datasets and save train sets at ``$PWD/data/train_data/`` and online evaluation sets at ``$PWD/data/eval_data/``.

```shell
bash data_preprocessing_zenodo.bash
```

## Subtask 1

### Run training for Subtask 1

RoBERTa Large + CLS Aggregation

```shell
cd subtask1/easyclassification
bash exp_scripts/run.exp.roberta.large.bash
```

RoBERTa Large + CNN Aggregation

```shell
cd subtask1/easyclassification
bash exp_scripts/run.exp.cnn.robert-large.finetune.bash
```

### Run prediction on Subtask 1

```shell
python -m classificationnet.running.ensemble \
  -device 4 \
  -data <path-to-dev-output-jsonl> \
  -model model/subtask1_cnn_roberta-large_cv*_ch300_cw3/ model/subtask1_roberta-large_cv*_5e-6 \
  -metadata sentenceID \
  -output <path-to-dev-output-jsonl>

python scripts/classification_pred_to_subtask1.py \
  -pred <path-to-dev-output-jsonl> \
  -output <path-to-dev-output-csv>
```

for example:
```shell
python -m classificationnet.running.ensemble \
  -device 0 \
  -data subtask1_test.jsonl \
  -model model/subtask1_aug_finetune_cnn_roberta-large_cv1_ch300_cw3_lr5e-6 \
  -output model/subtask1_aug_finetune_cnn_roberta-large_cv1_ch300_cw3_lr5e-6/output.jsonl
```

### Run models with augmentation

Load the data:
```shell
bash data_preprocessing_augment.bash
```

Modify model bash : `#5  export DATA_FOLDER='../../data/train_data/subtask1_augment'`

Then run models:
```shell
cd subtask1/easyclassification
bash exp_scripts/run.exp.roberta.large.bash
```
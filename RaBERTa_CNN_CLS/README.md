# Counterfactual Statement Identification

This project is a course assignment for Fudan University, Spring 2025. The project is inspired by the SemEval-2020 Task 5 dataset and focuses on identifying counterfactual statements in text.

## Project Overview

We built a counterfactual statement identification system based on the SemEval-2020 Task 5 dataset. The main contributions and methods of our work include:

- **Fine-tuning Pretrained Language Models**: We fine-tuned mainstream pretrained models such as BERT, RoBERTa, and XLNet for the counterfactual statement classification task. Model ensembling was employed to further improve overall performance.  

- **Data Augmentation with Large Language Models**: To address class imbalance and enhance data diversity, we generated counterfactual samples using large language models.  

- **Multi-task Learning Framework**: We designed a multi-task learning framework by adding temporal identification as an auxiliary task. This improves the model's ability to recognize counterfactual statements with specific temporal contexts.  

- **Parameter-Efficient Fine-Tuning with LoRA**: We applied Low-Rank Adaptation (LoRA) techniques for parameter-efficient fine-tuning, achieving over 50% training speedup while compressing model parameters to approximately 1% of the original size.  

## Results

The final system achieved excellent performance on the test set:  

- **Recall**: 0.9187  
- **F1 Score**: 0.9088  

## References

- [SemEval-2020 Task 5: Detecting Counterfactuals](https://semeval.github.io/2020/task5/)

from transformers import DistilBertForSequenceClassification, DistilBertTokenizer, Trainer, TrainingArguments, pipeline
from datasets import load_dataset

# Load dataset
#dataset = load_dataset("imdb")

# Load pre-trained DistilBERT model and tokenizer
model_name = "BAAI/bge-large-en-v1.5"
model = DistilBertForSequenceClassification.from_pretrained(model_name)
tokenizer = DistilBertTokenizer.from_pretrained(model_name)

# Train the model


# Save the finetuned model locally
model.save_pretrained("./bge-large-en-v1.5")
tokenizer.save_pretrained("./finetuned_model")


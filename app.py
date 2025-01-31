# Generative AI application for Text Generation

from fastapi import FastAPI
from transformers import pipeline

# Create a new FastAPI app instance
app=FastAPI()

# Initialise the text generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"message": "Hello World"}

# Define a function to handle the GET response at /generate
@app.get("/generate")
def generate(text:str):
    #use the pipeline to generate text from given input text
    output=pipe(text)

    #return the generate text in json response
    return {"output": output[0]['generated_text']}
from fastapi import FastAPI
from transformers import pipeline


##create a new fastapi app instance
app=FastAPI()

##initialize pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")
@app.get("/")

def home():
    return{"message":"hello world"}


# define a function to handle get request at / generate

@app.get("/generate")
def generate(text:str):
##use the pipeline to generate the text from the given input
    output=pipe(text)
##return generate text in json response\
    return{"output":output[0]['generated_text']}
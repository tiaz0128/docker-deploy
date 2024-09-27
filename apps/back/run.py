from fastapi import FastAPI
from fastapi.responses import PlainTextResponse


app = FastAPI()


@app.get("/")
def health(response_class=PlainTextResponse):
    return "healthy"


@app.get("/{arg}")
def whale_say(arg: str, response_class=PlainTextResponse):
    return f'''
    < {arg} >
     ----- 
            \\
             \\
                \\     
                                            ##        .            
                                ## ## ##       ==            
                         ## ## ## ##      ===            
                 /""""""""""""""""___/ ===        
        ~~~ {{~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
                 \\______ o          __/            
                    \\    \\        __/             
                        \\____\\______/   
'''

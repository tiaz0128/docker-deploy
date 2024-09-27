from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from fastapi.responses import HTMLResponse


app = FastAPI()


@app.get("/")
def health(response_class=PlainTextResponse):
    return "healthy"


@app.get("/{word}")
def whale_say(word: str):
    whale_ascii = f'''
    < {word} >
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

    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Whale Say</title>
        <style>
            body {{
                background-color: #f0f8ff;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: monospace;
            }}
            .whale-container {{
                background-color: white;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }}
            pre {{
                font-size: 14px;
                line-height: 1.2;
                color: #333;
                white-space: pre-wrap;
            }}
        </style>
    </head>
    <body>
        <div class="whale-container">
            <pre>
{whale_ascii}
            </pre>
        </div>
    </body>
    </html>
    """
    return HTMLResponse(content=html_content, status_code=200)

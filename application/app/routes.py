from app import app

@app.route('/')
def index():
    return "It works!\n"

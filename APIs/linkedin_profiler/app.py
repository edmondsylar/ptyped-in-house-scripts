from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return {"Success":"You can start developing your alfie driver"}

if __name__ == '__main__':
    app.run(debug=True)

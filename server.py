# server.py
from flask import Flask, jsonify, render_template_string
import json

app = Flask(__name__)

@app.route('/')
def home():
    return render_template_string("""
        <h1> Welcome to the web sccccrrrraaapeeer!! </h1>
        <p> Goooo to <a href = "/data"> /data </a> to view the scrapeed content. </p>
        """)

@app.route('/data')
def index():
    with open('scraped_data.json') as f:
        data = json.load(f)
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

from flask import Flask, request,  render_template

app = Flask(__name__)

@app.route("/", methods=['POST', 'GET'])
def index():
    # the code below is executed if the request method
    # was GET or the credentials were invalid
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)

from flask import Flask
from flask import jsonify, request
import requests 
from flask import render_template, redirect
import json
from tinydb import TinyDB, Query

app = Flask(__name__)
db = TinyDB('/tmp/db.json')
regive_data = db.table("regives")
boxes_data = db.table("boxes")


@app.route('/')
def hello_world():
    return 'Flask Dockerized'

@app.route('/regives', methods=['GET'])
def regives():
    return json.dumps(regive_data.all()), 200, {'ContentType':'application/json'} 


# email=john.smith@sap.com&orderNumber=000012345
@app.route('/regive', methods=['GET'])
def regive_get():
    email = request.args.get('email')
    ordernumber = request.args.get('orderNumber')
    replacedby= request.args.get('productDescription')
    price = requests.get("https://lambda-giving-stage.sa-hackathon-16.cluster.extend.sap.cx/?id={}".format(ordernumber)).text
    return render_template('regive.html', email=email, ordernumber=ordernumber,replacedby=replacedby ,price=price, boxselector=boxes_data.all())

@app.route('/regive', methods=['POST'])
def regive_post():
    email = request.form.get('email')
    ordernumber = request.form.get('ordernumber')
    donatedObject =request.form.get('donatedObject')
    replacedby = request.form.get('replacedby')
    box = request.form.get('box')
    regive_data.insert({'email': email, 'ordernumber': ordernumber, 'donatedObject':donatedObject,'replacedBy':replacedby, 'box':box})
    return redirect('/map')

@app.route('/boxes', methods=['GET'])
def boxes():
    boxes = boxes_data.all()
    print("AllBoxes: "+str(boxes))
    Box = Query()
    for box in boxes:
        print("box:  "+str(box["address"]))
        print("Box.box:"+str())
        box_donators = regive_data.search(Box.box == box["address"])
        print("box_donators:"+str(box_donators))
        box["donators"] = box_donators
        box["status"] = "Collecting/DeliveredToOxfamMunich"
    myjson = { "product": "BDancers", "version": 0.1}
    myjson["boxes"] = boxes
    return json.dumps(myjson), 200, {'ContentType':'application/json'} 

@app.route('/box', methods=['GET'])
def box_get():
    return render_template('box.html')

@app.route('/box', methods=['POST'])
def box_post():
    box_owner = request.form.get('boxOwner')
    address = request.form.get('address')
    boxes_data.insert({'box_owner': box_owner, 'address': address })
    return redirect('/boxes')

@app.route('/map', methods=['GET'])
def map_get():
    return render_template('map.html')

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
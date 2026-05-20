#!/bin/bash

sudo yum install -y python3-pip
pip3 install flask psycopg2-binary

cat > /home/ec2-user/app.py << 'EOF'
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello from EC2 in eu-north-1a!</h1>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
EOF

nohup python3 /home/ec2-user/app.py > app.log 2>&1 &

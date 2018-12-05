

Similiar to this: https://www.patricksoftwareblog.com/steps-for-starting-a-new-flask-project-using-python3/

.h1 Development

python3 -m venv default # create the virtualenv
. default/bin/activate # activate env
pip install -r requirements.txt
python app.py

.h1 configure gcloud

# install gcloud 

# get the cluster assuming there is only one:
gcloud container clusters list | tail -1 | cut -d" " -f1

gcloud container clusters get-credentials cloudlab1 --region europe-west1-b

.h1 build & deploy

build.sh







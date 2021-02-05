# sudo yum install -y docker
# sudo systemctl enable docker.service
# sudo systemctl start docker.service
# sudo docker pull kaggle/python:latest
# sudo docker run -v $PWD:/tmp/working -w=/tmp/working -p 8888:8888 --rm -it kaggle/python

sudo yum install -y python3 
#pip3 install jupyterlab
#conda install -c conda-forge notebook
sudo pip3 install notebook
cd /home/vagrant
sudo -u vagrant /usr/local/bin/jupyter notebook --generate-config
#vi .jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = ''" >> .jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_origin = '*'" >> .jupyter/jupyter_notebook_config.py




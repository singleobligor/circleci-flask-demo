FROM python:3.6.8

#RUN apt-get clean \
#   && apt-get -y update

# Change work directory back to the root
WORKDIR /

# Create application service directory
RUN mkdir /usr/local/flaskapp

# # Copy application service files 
COPY . /usr/local/flaskapp/

# # Change work directory to the application service directory
WORKDIR /usr/local/flaskapp/

# # Install required packages 
RUN pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT [ "python" ]

CMD [ "/usr/local/flaskapp/controller/svc_controller.py" ]

# RUN chmod -R +x /usr/local/ma-is-svcs-excelprep/start.sh

# EXPOSE 9000

# #ENTRYPOINT ["/usr/local/ma-is-svcs-excelprep/start.sh"]
# ENTRYPOINT ["gunicorn", "wsgi", "--bind", "0.0.0.0:9000"]

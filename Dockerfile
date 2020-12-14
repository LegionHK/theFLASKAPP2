FROM python:3.8.6
COPY templates /
COPY tests /
COPY .gitignore /
COPY READMe.md /
COPY app.py /
COPY config.py /
COPY model_saved /
COPY Dockerfile /
COPY docker-compose.yml /
COPY requirements.txt /

RUN pip install -r requirements.txt
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts
RUN chmod +x /scripts/wait-for-it.sh
ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]


CMD python app.py runserver --host=0.0.0.0 --threaded
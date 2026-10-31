FROM quay.io/jupyter/scipy-notebook:latest

WORKDIR /home/jovyan/bd-a1

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY data/dataset.csv ./data/dataset.csv
COPY notebook/analysis.ipynb ./notebook/analysis.ipynb

USER root
RUN mkdir -p output/figures screenshots && \
    chown -R ${NB_UID}:${NB_GID} /home/jovyan/bd-a1
USER ${NB_UID}

CMD ["start-notebook.py", "--ServerApp.root_dir=/home/jovyan/bd-a1"]

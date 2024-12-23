FROM quay.io/jupyter/minimal-notebook@sha256:a36d366b72dd3ca08b674bbbf8b2cb0fa03134d1b1d9a18b3cbfeafc28fdf156

COPY ./docker/jupyter/requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

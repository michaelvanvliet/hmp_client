# Basic Python3.6 install
FROM python:3.6.5-alpine3.6

# set ENVS
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# install python dependencies
RUN pip install boto

# copy scripts and example data
COPY test/*.tsv /tmp/
COPY bin/*.py /src/

# default working directory
WORKDIR /src/

# when no manifest is provided, it will use the example
CMD ["--manifest", "/tmp/hmp_cart_example.tsv"]

# default entrypoint
ENTRYPOINT ["python", "/src/hmp_client.py"]

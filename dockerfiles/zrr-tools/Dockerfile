FROM python:3.11-alpine

# install package
COPY requirements.txt /requirements.txt
COPY get_ip.py /get_ip.py
RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR "/"
EXPOSE 22
CMD ["python", "/get_ip.py"]

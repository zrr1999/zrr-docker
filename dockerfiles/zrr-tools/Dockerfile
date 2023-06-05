FROM python:3.11-alpine

# install package
RUN pip install --no-cache-dir -r requirements.txt
COPY get_ip.py /get_ip.py

WORKDIR "/"
EXPOSE 22
CMD ["python", "/get_ip.py"]

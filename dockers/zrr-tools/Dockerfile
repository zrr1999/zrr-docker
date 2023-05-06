FROM python:3.11

# install package
RUN pip install fastapi uvicorn
COPY get_ip.py /get_ip.py

WORKDIR "/"
EXPOSE 22
CMD ["python", "/get_ip.py"]

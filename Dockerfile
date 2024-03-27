FROM python:3.9.19-slim

COPY web.py /web.py

CMD ["python3", "/web.py"]
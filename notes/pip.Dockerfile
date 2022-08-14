FROM python:slim

ENV FLASK_APP=app.identidock
RUN adduser user
USER user
#WORKDIR /home/myuser
ENV PATH="$HOME/.local/bin:$PATH"
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "identidock.py"]
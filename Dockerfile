FROM python:3-alpine
ENV CRON_SIGNIN='* 9 * * *'
ENV TZ=Chicago/America
RUN adduser app -D
RUN apk add --no-cache tzdata
WORKDIR /app
ADD . /app
RUN pip3 install -r requirements.txt && rm requirements.txt
USER app
CMD ["python3", "genshin-os.py" ]

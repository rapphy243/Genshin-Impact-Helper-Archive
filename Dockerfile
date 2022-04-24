FROM python:3-alpine
ENV CRON_SIGNIN='* 9 * * *'
ENV TZ=Chicago/America
ENV USER_AGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36
RUN adduser app -D
RUN apk add --no-cache tzdata
WORKDIR /app
ADD . /app
RUN pip3 install -r requirements.txt && rm requirements.txt
USER app
CMD ["python3", "genshin-os.py" ]

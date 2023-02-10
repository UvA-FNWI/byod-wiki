FROM python:3.11 AS builder

COPY requirements.txt /

RUN pip install -r /requirements.txt

WORKDIR /tmp/build
COPY . .
RUN mkdocs build

FROM nginxinc/nginx-unprivileged:stable

COPY --from=builder /tmp/build/site /usr/share/nginx/html

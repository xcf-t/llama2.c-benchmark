FROM docker.io/ubuntu:noble-20260324

RUN apt update
RUN apt install -y build-essential

WORKDIR /work

COPY . .

CMD [ "make", "all", "output" ]

FROM alpine
WORKDIR /src
COPY Makefile .
ENV SOURCE=embano1/aktion
CMD echo Hello Github Action from $SOURCE
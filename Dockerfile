FROM gcc:latest 
#gcc because there is no official g++ base image

WORKDIR /app

COPY main.cpp ./main.cpp

RUN g++ -o app main.cpp

ENTRYPOINT ["./app"]

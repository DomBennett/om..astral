# Example host distro
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git default-jre unzip

RUN git clone --depth=10 https://github.com/smirarab/ASTRAL

RUN unzip ASTRAL/Astral.*.zip && \
    mv Astral/astral.*.jar Astral/astral.jar && \
    rm -r ASTRAL

# outsider *requires* working_dir
RUN mkdir /working_dir
WORKDIR /working_dir

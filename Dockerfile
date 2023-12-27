# Use a base image with Rust and Protocol Buffers installed
FROM rust:latest

# Use this line if you want to use a specific version of Rust
# FROM rust:1.55

# Install additional dependencies
RUN apt-get update && \
    apt-get install -y git make protobuf-compiler

# Set the working directory
WORKDIR /app

RUN mkdir -p /app/text-embeddings-inference
RUN mkdir -p /tmp/te
WORKDIR /app/text-embeddings-inference
# Clone the text-embeddings-inference repository
COPY ./text-embeddings-inference-main/ .
RUN ls -la  .
# Run the make command to build the project
RUN make

# Add any additional setup or configurations if needed
WORKDIR /app
# Specify the default command to run when the container starts
CMD ["/bin/bash"]

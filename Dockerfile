FROM maven:3-jdk-8 AS builder

# Install Graphviz, which is a dependency of StateLearner
RUN apt-get update && apt-get -y install graphviz

# Copy and compile StateLearner
WORKDIR /statelearner
COPY ./examples/docker/statelearner /bin/statelearner
COPY . .
RUN mvn package shade:shade

# Set entrypoint so this container can be used as a command
CMD statelearner

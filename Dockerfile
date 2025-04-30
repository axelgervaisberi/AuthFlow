FROM ubuntu:20.04

# Set up environment
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.pub-cache/bin:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-8-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter doctor

# Copy the app files
WORKDIR /app
COPY . .

# Get dependencies and build for web
RUN flutter pub get
RUN flutter build web

# Set up a web server
FROM nginx:1.21.1-alpine
COPY --from=0 /app/build/web /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

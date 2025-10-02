# Base image
FROM ubuntu:22.04

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update & install core tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    software-properties-common \
    unzip \
    zip \
    htop \
    tmux \
    jq \
    make \
    build-essential \
    net-tools \
    nmap \
    traceroute \
    sudo \
    && apt-get clean

# Install PHP 8.2 + extensions
RUN add-apt-repository ppa:ondrej/php -y && \
    apt-get update && \
    apt-get install -y php8.2 php8.2-mbstring php8.2-xml php8.2-bcmath php8.2-curl php8.2-zip php8.2-gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js LTS
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip

# Set working directory
WORKDIR /home/coder/project

# Optional env vars (commented out for now)
# ENV AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID}
# ENV AWS_REGION=${AWS_REGION}
# ENV GITHUB_SHA=${GITHUB_SHA}

# Expose code-server port
EXPOSE 8080

# Start code-server with password authentication
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "--user-data-dir", "/home/coder/project"]

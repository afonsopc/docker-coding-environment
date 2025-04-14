FROM debian:latest

# USEFUL PACKAGES
RUN apt-get update
RUN apt-get install -y gcc make gdb libreadline-dev wget \
    git valgrind sudo python3 python3-dev python3-pip \
    python3-venv clang curl nano vim unzip
RUN python3 -m pip install norminette --break-system-packages

# SETUP
RUN mkdir -p /home/user /home/user/.mega-secret /home/user/outside
COPY mega-secret.zip /home/user/.mega-secret/mega-secret.zip
COPY mega-secret.sh /home/user/.mega-secret/mega-secret.sh
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "PS1='\\[\\e[0;32m\\]\\u@\\h:\\[\\e[0;34m\\]\\w\\$ \\[\\e[m\\]'" >> /home/user/.bashrc
RUN echo "PS1='\\[\\e[0;31m\\]\\u@\\h:\\[\\e[0;34m\\]\\w\\$ \\[\\e[m\\]'" >> /root/.bashrc
RUN chmod +x /home/user/.mega-secret/mega-secret.sh
RUN echo "alias mega-secret='/home/user/.mega-secret/mega-secret.sh'" >> /home/user/.bashrc

# USER
RUN useradd -m user
RUN chown -R user:user /home/user
USER user
WORKDIR /home/user

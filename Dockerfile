FROM node:18.4.0-alpine3.16
USER root

RUN set -xe; \
    apk update && \
    apk add --update --no-cache \
    make \
    jq \
    mc \
    python3 \
    bash \
    git \
    ncurses \
    g++ && \
    mkdir /tmp/app && \
    git config --global --add safe.directory /tmp/app && \
    npm install pm2 -g
RUN  git clone --depth=1 https://github.com/Bash-it/bash-it.git /root/.bash_it  \
     && /root/.bash_it/install.sh \
     && touch /root/.bashrc \
     && sed -i -e 's/bobby/powerline-plain/g' /root/.bashrc \
     && sed -i -e 's/user_info scm python_venv ruby node cwd/user_info cwd scm/g' /root/.bash_it/themes/powerline-plain/powerline-plain.theme.bash \
     && source /root/.bashrc \
     && git config --global alias.nmerge "merge --no-ff" \
     && git config --global alias.co "checkout"\
     && git config --global alias.br "branch" \
     && git config --global alias.ci "commit" \
     && git config --global alias.st "status" \
     && git config --global alias.unstage "reset HEAD --" \
     && git config --global alias.last "log -1 HEAD" \
     && git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative" \
     && echo "termtitle() { printf \"\033]0;\$*\007\"; }" >> ~/.bashrc \
     && echo "termtitle \$TERMINAL_TITLE" >> ~/.bashrc
WORKDIR /tmp/app

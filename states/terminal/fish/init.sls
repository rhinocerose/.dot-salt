terminal/fish/install:
  pkg.installed:
    - name: fish

terminal/fish/config:
  file.managed:
    - name: {{ grains.homedir }}/config.fish
    - source: salt://{{ slspath }}/files/config.fish
    - user: {{ grains.user }}

terminal/zsh/zinit:
  git.latest:
    - name: https://github.com/zdharma/zinit.git
    - target: {{ grains.homedir }}/.zinit/bin
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains.user }}
    - unless: ls {{ grains.homedir }}/.zinit/bin

terminal/zsh/includes:
  file.recurse:
    - name: {{ grains.homedir }}/.dotfiles/.config/fish
    - makedirs: True
    - source: salt://{{ slspath }}/files/
    - clean: True
    - user: {{ grains.user }}

terminal/zsh/rawkode:
  user.present:
    - name: rawkode
    - shell: /usr/bin/zsh

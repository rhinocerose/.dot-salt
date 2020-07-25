terminal/fish/install:
  pkg.installed:
    - name: fish

terminal/fish/config:
  file.managed:
    - name: {{ grains.homedir }}/config.fish
    - source: salt://{{ slspath }}/files/config.fish
    - user: {{ grains.user }}

terminal/zsh/includes:
  file.recurse:
    - name: {{ grains.homedir }}/.dotfiles/.config/fish/
    - makedirs: True
    - source: salt://{{ slspath }}/files/
    - clean: True
    - user: {{ grains.user }}

terminal/zsh/arch:
  user.present:
    - name: arch
    - shell: /usr/bin/fish

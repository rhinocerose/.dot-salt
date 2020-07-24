vim/install:
  pkg.installed:
    - name: vim

vim/dein/install:
  cmd.script:
    - name: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - args: {{ grains.homedir }}/.dein
    - runas: {{ grains.user }}
    - unless: ls {{ grains.homedir }}/.dein

vim/configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/vim/vimrc
    - source: salt://{{ slspath }}/files/vimrc
    - template: jinja
    - makedirs: True
    - user: {{ grains.user }}

vim/install:
  pkg.installed:
    - name: vim


vim/plugins:
  file.managed:
    - name: {{ grains.homedir }}/.vim/vim-plug.vim
    - source: salt://{{ slspath }}/files/vim-plug.vim
    - makedirs: True
    - user: {{ grains.user }}

vim/configuration:
  file.managed:
    - name: {{ grains.homedir }}/.vim/vimrc
    - source: salt://{{ slspath }}/files/vimrc
    - makedirs: True
    - user: {{ grains.user }}

vim/install:
  pkg.installed:
    - name: vim


vim/plugins:
  file.managed:
    - makedirs: True
    - user: {{ grains.user }}
    - names: 
      - {{ grains.homedir }}/.vim/vim-plug.vim
        - source: salt://{{ slspath }}/files/vim-plug.vim
      - {{ grains.homedir }}/.vim/vimrc
        - source: salt://{{ slspath }}/files/vimrc

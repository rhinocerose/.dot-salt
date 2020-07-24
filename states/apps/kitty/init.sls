kitty/config:
  file.recurse:
    - user: {{ grains.user }}
    - makedirs: True
    - clean: True
    - name: {{ grains.homedir }}/.config/kitty/
    - source: salt://{{ slspath }}/files/

kitty/install:
  pkg.installed:
    - name: kitty

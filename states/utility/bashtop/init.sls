bashtop/config:
  file.recurse:
    - user: {{ grains.user }}
    - makedirs: True
    - clean: True
    - name: {{ grains.homedir }}/.config/bashtop/
    - source: salt://{{ slspath }}/files/

bashtop/install:
  pkg.installed:
    - name: bashtop

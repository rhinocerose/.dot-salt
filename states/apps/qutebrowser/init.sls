qutebrowser/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/qutebrowser/config.py
    - source: salt://{{ slspath }}/files/config.py
    - user: {{ grains.user }}
    - makedirs: True

qutebrowser/install:
  pkg.installed:
    - name: qutebrowser

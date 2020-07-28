{% for user, args in pillar['users'].iteritems() %}
rofi/config:
  file.recurse:
    - user: {{ user }}
    - makedirs: True
    - clean: True
    - name: {{ args['home'] }}/.config/rofi/
    - source: salt://{{ slspath }}/files/
{% endfor %}

rofi/install:
  pkg.installed:
    - name: rofi

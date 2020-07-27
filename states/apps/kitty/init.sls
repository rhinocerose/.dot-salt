{% for user, args in pillar['users'].iteritems() %}
kitty/config:
  file.recurse:
    - user: {{ user }}
    - makedirs: True
    - clean: True
    - name: {{ args['home'] }}/.config/kitty/
    - source: salt://{{ slspath }}/files/
{% endfor %}

kitty/install:
  pkg.installed:
    - name: kitty

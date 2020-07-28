% for user, args in pillar['users'].iteritems() %}
starship/config:
  file.managed:
    - user: {{ user }}
    - makedirs: True
    - clean: True
    - name: {{ args['home'] }}/.config/starship.toml
    - source: salt://{{ slspath }}/files/
{% endfor %}

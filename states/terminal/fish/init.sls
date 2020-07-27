{% for user, args in pillar['users'].iteritems() %}
terminal/fish/install:
  pkg.installed:
    - name: fish

terminal/fish/config:
  file.managed:
    - name: {{ args['home'] }}/config.fish
    - source: salt://{{ slspath }}/files/config.fish
    - user: {{ user }}

terminal/fish/includes:
  file.recurse:
    - name: {{ args['home'] }}/.dotfiles/.config/fish/
    - makedirs: True
    - source: salt://{{ slspath }}/files/
    - clean: True
    - user: {{ user }}
{% endfor %}

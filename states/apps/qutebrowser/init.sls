{% for user, args in pillar['users'].iteritems()%}
qutebrowser/config:
  file.recurse:
    - name: {{ args['home'] }}/.config/qutebrowser/
    - source: salt://{{ slspath }}/files/
    - user: {{ user }}
    - makedirs: True
{% endfor %}

qutebrowser/install:
  pkg.installed:
    - name: qutebrowser

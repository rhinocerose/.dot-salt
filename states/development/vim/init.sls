vim/install:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}

{% for user, args in pillar['users'].iteritems() %} 
vim/plugins:
  file.recurse:
    - makedirs: True
    - user: {{ user }}
    - clean: True
    - name: {{ args['home'] }}/.vim/
    - source: salt://{{ slspath }}/files/
{% endfor %}

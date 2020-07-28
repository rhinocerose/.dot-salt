{% for user, args in pillar['users'].iteritems() %}
polybar/config:
  file.recurse:
    - user: {{ user }}
    - makedirs: True
    - clean: True
    - name: {{ args['home'] }}/.config/polybar/
    - source: salt://{{ slspath }}/files/

polybar/clone:
  git.cloned:
    - name: https://aur.archlinux.org/polybar.git
    - target: {{ args['home'] }}/aur/polybar
    - branch: master
    - user: {{ user }}

polybar/install:
  cmd.run:
    - name: makepkg -si --noconfirm
    - cwd: {{ args['home'] }}/aur/polybar
    - runas: {{ user }}
{% endfor %}

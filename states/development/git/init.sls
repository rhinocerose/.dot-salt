git:
  pkg.installed

git/github-cli:
  aur.installed:
    - name: github-cli-bin

{% for user, args in pillar['users'].iteritems() %}
git/config/directory:
  file.directory:
    - name: {{ args['home'] }}/.config/git
    - user: {{ user }}

git/config:
  file.managed:
    - name: {{ args['home'] }}/.config/git/config
    - source: salt://{{ slspath }}/files/git.config
    - user: {{ user }}

git/ignores:
  file.managed:
    - name: {{ args['home'] }}/.config/git/ignores
    - source: salt://{{ slspath }}/files/git.ignores
    - user: {{ user }}
{% endfor %}

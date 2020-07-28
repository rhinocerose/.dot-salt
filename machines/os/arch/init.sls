include:
  - os.arch.plymouth

go:
  pkg.installed

{% for user, args in pillar['users'].iteritems() %}
yay/clone:
  git.cloned:
    - name: https://aur.archlinux.org/yay-bin.git
    - target: {{ args['home'] }}/yay
    - branch: master
    - user: {{ user }}

yay/install:
  cmd.run:
    - name: makepkg -si --noconfirm
    - cwd: {{ args['home'] }}/yay
    - runas: {{ user }}
{% endfor %}

arch:
  user.present:
    - fullname: rhinocerose
    - remove_groups: False
    - groups:
      - input
      - users
      - wheel

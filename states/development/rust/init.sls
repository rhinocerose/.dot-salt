rustup:
  pkg.installed

{% for user, userargs in pillar['users'].iteritems() %} 
rustup-nightly:
  cmd.run:
    - name: rustup install stable
    - runas: {{ user }}
    - require:
      - pkg: rustup

rustup-nightly-default:
  cmd.run:
    - name: rustup default stable
    - runas: {{ user }}
    - require:
      - pkg: rustup
{% endfor %}



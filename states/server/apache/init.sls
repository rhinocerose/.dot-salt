apache:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:apache', 'apache') }}

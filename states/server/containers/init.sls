containers/install:
  pkg.installed:
    - names:
      - crun
      - docker
      - docker-compose
      - podman

containers/docker/service:
  service.running:
    - name: docker
    - enable: True
    - reload: True
    - require:
      - pkg: docker

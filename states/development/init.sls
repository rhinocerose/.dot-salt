include:
  - states.development.git
  - states.development.nodejs
  - states.development.python
  - states.development.vim

development/make_tools:
  pkg.installed:
    - names:
      - bison
      - cmake
      - make
      - meson
      - ninja
      - shfmt

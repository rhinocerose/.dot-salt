fonts/install:
  pkg.installed:
    - pkgs:
      - noto-fonts
      - noto-fonts-emoji
      - ttf-cascadia-code
      - ttf-google-fonts-typewolf
      - awesome-terminal-fonts
      - otf-powerline-symbols
      - otf-font-awesome
      - powerline-fonts
      - ttf-font-awesome
      - ttf-material-design-icons-git
      - ttf-material-design-icons-webfont
      - ttf-font-awesome-5
      - ttf-font-awesome-4
      - ttf-lato
      - ttf-dejavu
      - ttf-fira-code

# Raise priority of Noto Color Emoji
fonts/emoji/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/fontconfig/conf.d/01-emoji.conf
    - source: salt://{{ slspath }}/files/fontconfig.xml
    - user: {{ grains.user }}
    - makedirs: True

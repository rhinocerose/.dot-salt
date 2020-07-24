fonts/install:
  pkg.installed:
    - pkgs:
      - noto-fonts
      - noto-fonts-emoji
      - ttf-cascadia-code
      - ttf-google-fonts-typewolf
      - awesome-terminal-fonts
      - otf-font-awesome
      - powerline-fonts
      - ttf-font-awesome

# Raise priority of Noto Color Emoji
fonts/emoji/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/fontconfig/conf.d/01-emoji.conf
    - source: salt://{{ slspath }}/files/fontconfig.xml
    - user: {{ grains.user }}
    - makedirs: True

{% from "winssh/map.jinja" import winssh with context -%}

winssh-packages:
  file.managed:
    - name: c:\alkivi\packages\winssh\{{ winssh.installer }}
    - source: {{ winssh.url  }}
    - source_hash: sha256={{ winssh.hash }}
    - makedirs: True
    - unless: 

winssh-install:
  cmd.run:
    - name: {{ winssh.installer }} /port={{ winssh.port }} /password {{ pillar.get password }} /domain={{ winssh.domain }} /keysize={{ winssh.keysize }} /x86={{ winssh.arch }}
    - cwd: c:\alkivi\packages\winssh\
    - require:
      - file: c:\alkivi\packages\winssh\{{ winssh.installer }}

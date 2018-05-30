docker run -w /foo -v `pwd`:/foo -v /tmp/pandoc-goodies/templates/html5/github/GitHub.html5:/root/.pandoc/templates/template.html amra/documentation-as-code \
  pandoc --self-contained --standalone --number-sections --table-of-contents 03-DFS180-API-MH-edit.md -o 04-DFS180-API-MH.html --template template

docker run -w /foo -v `pwd`:/foo amra/documentation-as-code pandoc --standalone -N 01-DFS180-API-MH.docx -o 02-DFS180-API-MH-init.md --extract-media ./02-media --wrap=none --atx-headers

docker run -w /foo -v `pwd`:/foo escalope/pandoc-mermaid-plantuml pandoc -s -N schema.md -o output/schema.html --filter mermaid-filter

pandoc faq-fr.md -o faq-fr.html --toc --toc-depth=4 -w html5 --template template.html -V "pagetitle: Foire Aux Questions" -V "title: Foire Aux Questions" -V "lastmodified: $(date)" -V toctitle:"Table des matières"
pandoc faq-en.md -o faq-en.html --toc --toc-depth=4 -w html5 --template template.html -V "pagetitle: Frequently Asked Questions" -V "title: Frequently Asked Questions" -V "lastmodified: $(date)"


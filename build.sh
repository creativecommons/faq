pandoc french-faq.md -o faq-fr.html --toc --toc-depth=3 --number-sections --from markdown+implicit_header_references -w html5 --template template.html -V "pagetitle: Foire Aux Questions" -V "title: Foire Aux Questions"
pandoc faq.md -o faq-en.html --toc --toc-depth=3 --number-sections --from markdown+implicit_header_references -w html5 --template template.html -V "pagetitle: Frequently Asked Questions" -V "title: Frequently Asked Questions"

git add .
git commit -m "Updates"
rsync *.html mattl@labs.creativecommons.org:~/public_html/
git push origin master

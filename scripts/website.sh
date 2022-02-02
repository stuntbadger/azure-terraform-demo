#!/bin/bash
echo "creating web site"
sudo bash -c `echo "<html><body><h2>very quick website test</h2></body></html>" > /var/www/html/index.html`

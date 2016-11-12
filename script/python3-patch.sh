#cd "`python -c 'import site; print(site.getsitepackages()[0])'`/expfactory/"
cd /opt/conda/lib/python3.5/site-packages/expfactory/

find . -name "*.py" | xargs sed -i -e 's/iteritems/items/g'
find . -name "*.py" | xargs sed -i -e 's/print \(.*\)$/print(\1)/'
find . -name "*.py" | xargs sed -i -e 's/SimpleHTTPServer/http.server/'
find . -name "*.py" | xargs sed -i -e 's/SocketServer/socketserver/'

sed -i -e 's/from exceptions import ValueError//' survey.py
sed -i -e '322s/^./\ \ \ \ \ \ \ \ /' survey.py

sed -i -e 's/urllib2/urllib.request/' utils.py
sed -i -e 's/__init__/expfactory.__init__/' utils.py
sed -i -e '84s/"rb"/"r"/' utils.py
sed -i -e 's/basestring/str/' utils.py

sed -i -e 's/ \([^ ]*\.keys()\)\(\[.*\]\)/ list(\1)\2/' battery.py

sed -i -e '43 a \ \ \ \ valid_games = []' battery.py # bug fix
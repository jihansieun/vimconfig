echo "ctags, cscope 설치중..."
ctags -R
./mkcscope.sh
#cp ./mkcscope.sh /usr/bin
vi -c :UpdateTypesFile  -c :qa



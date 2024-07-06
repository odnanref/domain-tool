go build
mv domaintool bin/
cd domain-tool-updater/
go build
mv domain-tool-updater ../bin/
cd ..
docker build -t domain-tool:latest .

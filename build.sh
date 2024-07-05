go build
mv domaintool bin/
docker build -t domain-tool:latest .

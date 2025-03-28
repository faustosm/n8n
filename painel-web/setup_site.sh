docker build -t painel-fsmhub .
docker run -d -p 4321:80 --name painel-fsmhub painel-fsmhub

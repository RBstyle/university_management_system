if [ ! -e .env ]
then
    mv .env.example .env
fi

docker build -t unversity_management_system .
docker-compose down
docker-compose up

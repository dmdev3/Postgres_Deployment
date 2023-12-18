docker-compose up -d
timeout /t 5
docker exec postgres-test2 psql -U denysm -d db_test2 -c "SELECT VERSION();"
pause
REM docker-compose build && docker-compose up 
docker build . --tag=nanos_local
REM docker run --rm -it -p 8083:8083 -v "%~dp0:/root/.ops/images/" nanos_local
docker run --rm -it -p 8083:8083 nanos_local
pause
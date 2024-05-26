# Etap 2

# Dockerfile
```
# Etap drugi: Konfiguracja Nginx
FROM nginx:alpine

# Skopiowanie aplikacji z lokalnego katalogu do katalogu serwera Nginx
COPY ./app /usr/share/nginx/html

# Konfiguracja Nginx, aby nasza aplikacja była stroną domyślną
COPY nginx.conf /etc/nginx/nginx.conf

# Dodanie sprawdzania zdrowia (HEALTHCHECK)
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s CMD curl -f http://localhost/ || exit 1

# Eksponowanie portu
EXPOSE 80

# Uruchomienie serwera Nginx w trybie pierwszoplanowym
CMD ["nginx", "-g", "daemon off;"]
```

# Polecenie do budowy obrazu i wynik działania
```
docker build -t my-nginx-app .
```
Wynik działania:
```
C:\Users\Varep\Desktop\chmuryLab5\my-nginx-app>docker build -t my-nginx-app .
[+] Building 0.0s (0/0)  docker:default
2024/05/26 16:55:55 http2: server: error reading preface from client //./pipe/docker_engine: file has already been close[+] Building 1.6s (8/8) FINISHED                                                                         docker:default
 => [internal] load build definition from Dockerfile                                                               0.4s
 => => transferring dockerfile: 560B                                                                               0.3s
 => [internal] load metadata for docker.io/library/nginx:latest                                                    0.0s
 => [internal] load .dockerignore                                                                                  0.2s
 => => transferring context: 2B                                                                                    0.1s
 => [1/3] FROM docker.io/library/nginx:latest                                                                      0.0s
 => [internal] load build context                                                                                  0.2s
 => => transferring context: 89B                                                                                   0.1s
 => CACHED [2/3] COPY ./app /usr/share/nginx/html                                                                  0.0s
 => CACHED [3/3] COPY nginx.conf /etc/nginx/nginx.conf                                                             0.0s
 => exporting to image                                                                                             0.1s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:d8fc3bbaebf7466d3401a78fd86966e6ce2ff4a4ea81feab60f68cb427ccaa67                       0.0s
 => => naming to docker.io/library/my-nginx-app                                                                    0.0s

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
```

# Polecenie uruchamiające serwer
```
docker run -d -p 80:80 my-nginx-app
```

# Polecenie potwierdzające działanie kontenera i poprawne funkcjonowanie opracowanej aplikacji
```
docker ps

CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                    PORTS                NAMES
16e71bd7f98e   my-nginx-app   "/docker-entrypoint.…"   11 minutes ago   Up 11 minutes (healthy)   0.0.0.0:80->80/tcp   happy_keller
```

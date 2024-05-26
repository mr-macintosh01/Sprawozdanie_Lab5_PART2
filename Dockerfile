# Etap drugi: Konfiguracja Nginx
FROM nginx:latest

# Skopiowanie aplikacji z lokalnego katalogu do katalogu serwera Nginx
COPY ./app /usr/share/nginx/html

# Konfiguracja Nginx, aby nasza aplikacja była stroną domyślną
COPY nginx.conf /etc/nginx/nginx.conf

# Dodanie sprawdzania zdrowia (HEALTHCHECK)
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s CMD curl -f http://localhost/ || exit 1

# Eksponowanie portu
EXPOSE 80

# Uruchomienie serwera Nginx
CMD ["nginx", "-g", "daemon off;"]

# Utiliser l'image officielle de Nginx comme base
FROM nginx:latest

# Créer le fichier nginx.conf directement dans le Dockerfile
RUN echo 'server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }
}' > /etc/nginx/nginx.conf

# Créer le fichier index.html directement dans le Dockerfile
RUN echo '<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Site Web</title>
</head>
<body>
    <h1>Bienvenue sur mon site web !</h1>
</body>
</html>' > /usr/share/nginx/html/index.html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
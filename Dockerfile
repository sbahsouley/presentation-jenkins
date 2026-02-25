# Utilise une image Nginx officielle
FROM nginx:alpine

# Copie ton site dans le dossier servi par Nginx
COPY . /usr/share/nginx/html

# Expose le port 80
EXPOSE 80

# Commande de démarrage
CMD ["nginx", "-g", "daemon off;"]

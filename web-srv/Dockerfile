FROM nginx:alpine

# Expost port 80
EXPOSE 80

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf

# copy content
COPY ./web-src/ /var/www/static
RUN ls -la /var/www/static/*


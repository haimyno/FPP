# Use the official PHP image with the necessary extensions
#Create this Dockerfile in the root of your Laravel project:

FROM php:8.2-fpm


# Install necessary dependencies


RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
	zip \
    unzip \
    git \
	nginx 
    
RUN apt-get update && apt-get install -y libxml2 libxml2-dev pkg-config	
RUN docker-php-ext-configure gd --with-freetype --with-jpeg 
RUN docker-php-ext-install -j$(nproc) gd pdo pdo_mysql xml

# Install Node.js and npm (to build frontend assets)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs


# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory to /var/www
WORKDIR /var/www

# Copy application code to the container
COPY . .
RUN chmod +x entrypoint.sh
# Install Laravel dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Install frontend dependencies
#WORKDIR /var/www/resources/js
#RUN rm -rf node_modules
RUN npm install

# Build frontend assets (React + TypeScript)
#RUN npm run build
#RUN npm run dev


# Set file permissions for Laravel (needed for storage and cache)
#RUN chown -R www-data:www-data /var/www && chmod -R 775 /var/www/storage /var/www/bootstrap/cache
#RUN chown -R www-data:www-data /var/www
RUN chown -R www-data:www-data /etc/nginx/conf.d
RUN chown -R www-data:www-data /var/www 
# Copy the Nginx configuration file into the container
#COPY ./nginx/default.conf /etc/nginx/conf.d/
COPY default.conf /etc/nginx/conf.d/

# Expose the container port
EXPOSE 9000
EXPOSE 5173
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
# Start PHP-FPM and Nginx
#CMD service nginx start
#CMD service nginx start && php-fpm
#CMD php-fpm

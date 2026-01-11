#lmsecuritecom
server {
    listen       80;
    root /usr/share/nginx/html/lmsecurite_wordpress/;
    server_name  lmsecurite.com www.lmsecurite.com;
    index index.php;

    location /nginx_status {
        stub_status on;
        access_log off;
        allow 172.19.0.1;
        deny all;
    }

    include /usr/share/nginx/html/docker_nginx_mysql_php7/nginx/restrictions.conf;

    # Additional rules go here.

    # Only include one of the files below.
    include /usr/share/nginx/html/docker_nginx_mysql_php7/nginx/wordpress.conf;

    #!!! IMPORTANT !!! We need to hide the password file from prying eyes
    # This will deny access to any hidden file (beginning with a .period)
    location ~ /\. { deny  all; }


    error_log /var/log/nginx/lmsecurite_error.log;
    access_log /var/log/nginx/lmsecurite_access.log;


}
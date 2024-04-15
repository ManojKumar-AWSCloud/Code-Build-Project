# Use the official Nginx image as base
FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Remove the default Nginx configuration
RUN yum update -y
RUN yum install nginx -y
#RUN rm /etc/nginx/conf.d/default.conf
# Copy your HTML file into the Nginx server directory
COPY index.html /usr/share/nginx/html/

# (Optional) If you have additional static files (e.g., CSS, JavaScript), you can copy them as well
# COPY css/style.css /usr/share/nginx/html/css/
# COPY js/script.js /usr/share/nginx/html/js/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]


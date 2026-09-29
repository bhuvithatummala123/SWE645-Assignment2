# SWE 645 Assignment 2
# This Dockerfile creates a container for the SWE 645 student survey application.

FROM nginx:alpine

COPY survey.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

EXPOSE 80
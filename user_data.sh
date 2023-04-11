
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<html>
      <head>
      <title>Hello World!</title>
      </head>
      <body>
      <h1>Hello World! WELCOME TO THIS CHALLENGE, BY CARLOS. </h1>
      </body>
      </html>" > /var/www/html/index.html



# #!/bin/bash
# apt-get update
# apt-get install -y apache2
# systemctl start apache2
# systemctl enable apache2
# echo "<html><head><title>Hello World, welcome to the SED challenge </title></head><body><h1>this was build by CARLOS, using terraform!</h1></body></html>" > /var/www/html/index.html

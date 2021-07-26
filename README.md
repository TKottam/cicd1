# cicd1
•	This open-source project covers various concepts of the flask framework, and this also satisfies the requirement of having a database in the CICD pipeline
•	The open-source project I have chosen to build final CICD pipeline is using python with a simple interface and data base components 
o	app.py – This application uses flask to build the front-end interface with dependencies like Flask,Werkzeug, hashlib and other packages 
o	Database used in this project is a SQL lite and it is used to store all the user information and other components of the application 
•	This Project has different pages and other user data which is used to allow users to login as admin, add other users and manage images that were uploaded to this portal
•	The main flow of the project is to have a webpage where users can upload the images to data base and delete them as required. To have users upload images the admin will provision the user which are stored on the database. To name images a hash is generated on the fly which is used as unique reference for the images to be stored
•	There are 4 different webpages in the project index.html, public_page.html, admin.html, private_page.html. All the other exceptions have independent webpages based on the error application encounters example- access error, action forbidden error

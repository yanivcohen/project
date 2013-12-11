== README

This README covers installation setup and deployment of the IATA web project.

To run this project, download the entire repository contents onto your Ubuntu computer and run '. setupServer.sh'. After you enter your user password (sudo priviledges are required for installing software), the script will take care of installing needed software, setting up the environment, and populating the database with sample data.

Once the envrionment has been set up (it only needs to be done once) execute the command 'rails server' in the command line. This will start the webserver which can be accessed via the URL 'localhost:3000'.

Note: in order to successfully run the 'rails server' command, you must be somewhere in the project's directory tree. Attempting to enact rails commands outside of a directory with a ruby/rails app will cause your computer great confusion.

To shut down the webserver when you are done, either exit the terminal running the server or interrupt the running process (with CTRL+c or the kill command).

Important details:
This project has very specific software requirements. The setup script will install all needed software, but you may want to do this on a virtual machine so that you don't do a single purpose installation on an in-use computer.

* This project is designed to run on Ubuntu 12.04
** The software itself will likely run on other Unix systems, but the setup script probably wont.
* This project uses ruby 2.0.0 with rails 4.0
* This project requires a javascript runtime environment (like nodejs)
* This project requires the use of the postgresql-9.1 database

Any software that the user does not have installed on his machine already can be installed simply by running  '. setupServer.sh' script included in this project.

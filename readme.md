hello!
welcome to my zipcodes demo.
in this project i used php, http://www.zippopotam.us/ api, and just a tiny bit of javascript to show save into a database and show a list of places.
the flow:
the user selects a country (or uses a defualt country, usa).
inserts a zipcode.
click the submit btn.
the js code is 'listening to the click event. 
once the event is issues, a 'get' http request is sent to the server with the country code and zipcode in the url.
in the server, class route begins the flow. if both zip and country are sent, th flow will continue. in a case the zip is empty,
a response will be sent to the client. the client will present the messege if the response status is 'faild'.
otherwise, the class route will initiate a search in the database for a place with a zipcode and country matching the data. 
every place has a zipcode, but a zipcode may have a lot of places. every zip code has a country, 
but every country may have lots of zipcodes.
once the places are found in the db, the server will respond to the client with the data.
the client will present the data in a table.
if the server is unable to find a match in the DB, it will make a request to the api. 
if the api is unable to find a match, the server will respond with 'failed' and the cleint will respond correctly.
once the api returns data, the server will arrange it. once its done, the server will 'insert' to the zipcode table the new zipcode,
and then all the places with the zipcode's id (foreign key). once its done, the server will respond to the client,
which will present the data in a table.

                        in order to test and install:

install xampp and php.
download this project to xampp folder, and put it in htdocs.
activate mysql and apache in xampp.
in phpmyadmin, create a new database called exacly = zipcodes   . once this is done, import zipcodes.sql to that DB.
now ur good to go! put in the url localhost/zip, fill in a country and a zipcode and start testing!

u may find a zipcodes list here: http://www.geonames.org/postal-codes/

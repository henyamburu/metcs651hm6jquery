Web\default.aspx
================
The Web page reads in lines of text entered by users, separates them into words, sorts them, 
and prints them out together with their number of occurrences.

As User enters or changes the text, and word list are automatically or dynamically rendered onto the page.

HTTP Modules
-----------

- Modules.Authentication.cs, the authenticates users before servicing page.  The site employs a basic 
authentication scheme where user are prompted for credentials, User Name: Bart; Password: Mburu.

WCF Service
-----------
- Web/Service.svc, is service class that separates and sorts words.  
- The service is called on by jQuery's AJAX to request the web service asynchronously.



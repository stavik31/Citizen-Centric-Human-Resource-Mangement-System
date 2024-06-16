###U1
System allows for users to start the signup process by collecting their email, password, full name, and postal code.
Password strength is used while users receive feedback on password strength as they enter it. Finally, user 
consent is received as their account is created by redirecting them to the systems home page.

###U2
System allows for system administrators to create new user accounts and can link these accounts 
to an email, legal name, and optionally a postal code. Administrative users can also assign roles such as "citizen" or "smart city manager." 
Once an account has been administered, a one-time password reset link is send for users to change their password. 

###U3
System allows existing users to modify their legal name, current occupation, postal code, and password.


###U4
System allows users to select a “Forgot Password” link on the login page for users who need to recover their password. 
Clicking this link directs users to a password recovery page, where auth0 takes resposibility in leading users in the password reset/recovery process.

###U5
System allows users to select "delete account" where auth0 takes responsibility in leading the deletion process and notifying users of success or failure

###U6
System allows users to navigate SOC occupation levels starting from a broad overview of all occupations and narrowing down to detailed occupations. 
Each level would include titles, descriptions, examples, and additional content relevant to the user's role while displaying statistical content (InformationView)

###U7
System allows users to set their career goal by navigating through all SOC occupation levels (Major Group, Minor Group, Broad Occupation, Detailed Occupation). 
When a user decides on a goal and selects a occupation, the chosen career goal is saved to their profile.

###U8
Smart city managers have the capability to access historical unemployment data as a line graph through exploring all occupations listed on the system.

###U9
System allows users to view employment trends by exploring the SOC occupational levels. 

###U10
System allows users to view job postings by exploring the SOC occupational levels and
each job listing is clickable, redirecting users to an external webpage for more information. 

###U11
System allows users to view certification information by exploring the SOC occupational levels
and displays essential information about each certification, including a title and description.
Addtionally, users can click on each certification to be redirected to a separate page where more information and an external webpage url for the certification is given.

###U12
System allows users to view learning materials by exploring the SOC occupational levels and clicking on any material allows users to be redirected to a webpage where more information 
and an external url for the learning material is given.

###U13
System allows smart city managers have control over online learning materials within the system, 
including the ability to create, update, and delete learning meterials through a content management system (Contentful). 

###U14
System allows users can view the demand for each detailed occupation within the system, as defined by smart city managers. 
Optionally, the system may display demand values for higher levels provided that the lower level occupations have demand values themselves

###U15
System allows users to view news articles by exploring the SOC occupational levels while displaying specific information about each article such as title, organization, and published date

###U16
System allows smart city managers to have the capability to set demand targets directly in the system for specific detailed occupations.

###U17
System allows city managers to have access to various report types
Shown in the activity diagram shows viewing citizens' current occupations, retrieving occupational data from the existing database.
Viewing all other types of reports follows the same flow as shown. 

###U18
The system automatically scrapes news sources daily for articles posted within the last 24 hours and stores links to these articles along with their related SOC occupations

###U19
The system loads unemployment data from a government dataset by pulling data  from the Bureau of Labor Statistics API on the first day of each month and stores the data in the system

###U20
The system implements functionality to load certification data from a government partner dataset while allowing system administrators to upload the dataset into the database 

###U21
The system provides functionality to load SOC definitions, descriptions, and employment data from the Bureau of Labor Statistics by pulling SOC occupation definitions data and employment data on the first day of each month. 
























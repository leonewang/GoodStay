# GoodStay

GoodStay is a web application that will allow providers to present their holiday units, and searchers to review the offers and reserve or rent a property. This is a guide document for the development of our project. **Please follow the guideline listed below and make sure that you are clear about what you will do in the current period.**

**Database:** MySQL 5.6.41

**Tomcat:** 7.0.571

**Others:** jdk1.8, mysql-connector-java:5.1.28, javax.servlet-api:3.1.0

Before starting the project, please make sure that you have the same configuration and applications installed, and MySQL should have no root password.

Please find the database source data Dump20181014.sql in the root folder. You should run this sql file first which will create all tables we need for the project before starting tomcat server so that you can have an access to the right database without errors. 

You do not have to generate the war file by yourself, just find it in path GoodStay/target/Alidada.war, ​all the third-party libraries are included. Then put the war file into your tomcat webapp folder, and start tomcat by running ​startup command in your terminal.

The project is now deployed successfully and the server will start automatically, so you can visit the website on your browser at ​[http://localhost:8080/​](http://localhost:8080/​).

## Weekly Tasks

**Week 11 tasks**

- Personal profile page (edit the basic info, showing my bookings(completed / waiting / active) / my watch list / my posts(completed / active) / others' reviews)
- Help and documentation
- Post page should support image upload (by using third-party cloud server)
- Booking system (booking / cancel / edit / write a review)
- Message system
- Notification system
- Google map API (places) should be used for showing location info
- Stick a post to top
- User profile edit (include avatar upload)
- Advanced search
- Online customer service chat (by using Chatra)

**Week 10 tasks**

- Post detail page (showing the basic info and users' review)
- Make a reservation (using sweetalert)

**Week 9 tasks**

- Index page (users can search without login)

**Week 8 tasks**

- Advertisement posting page.
- Main page (represent advertisement).

**Week 7 tasks**

- User profile page (CRUD).
- Simple notification system.
- Password refind.

**Week 6 tasks**

- Login and register page.
- Advertisement posting page.

**Week 5 tasks**

- Building the database from database model to database management system (mysql).

**Week 4 tasks**

- Designing the database structure.
- Building the project structure model.
- Setting up whe whole development environment.

**Week 3 tasks**

- Testing all the tools and online services will be used.
- Group members who are not familiar with Git should know enough of it for web development after this week.

**Work Diary**

Please do not forget to write your working diary and upload it to the directory 'work_diary' once per week at least. The name of your work diary should in the format, `your_zid.txt`.
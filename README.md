# Sample social network database

**The project is to design a relational database of facebook. The main aim is purely focusing on facebook on the basis of its social networking aspect and how its databases are created.
Facebook has many features in it namely posting statuses, adding friends, chatting etc.**

A user can access all these features.
This database will consist of 6 tables. They are:

1. User : When a user creates a new facebook ID, this entity stores its ID number, email address, User’s first and second name and phone number.
Here, facebook_ID will be the primary key and phone number will have the unique constraint.

2. Contacts : A user’s contact list will be stored in this entity. It stores the user_id of the contact who is accessing the database, first and last name’s of their contact, and friend ID.
Here, friend ID will be the primary key and user_id will be the foreign key which will refer to the user table’s facebook_ID.

3. Conversation: A user’s conversation details will be stored in this entity. It will consist of the sender’s ID, receiver’s ID and title of the conversation.
Here, the sender’s ID will be the foreign key referring to the user entity’s facebook_ID.

4. Status: This entity will show the status which has been updated by the user.
It will consist of the user’s id, first and second name, date on which status was posted and status post ID.
Here, post_id will be the primary key, and user_id will be the foreign key referring to the user entity’s facebook_ID.

5. Photographs: This entity consists of the user id, photo id, photo description & date on which the photograph was posted. 
Here, photo_id will be the primary key and user_id will be the foreign key referring to the user entity’s facebook_ID.

6. Number of friends : This table will consists of the number of friends of a user and their user id.
Here, user_id will be the foreign key referring to the user entity’s facebook_ID.

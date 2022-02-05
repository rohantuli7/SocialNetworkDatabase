create table facebookuser(facebook_ID number(5) primary key, email varchar(50), first_name char(30), second_name char(30), phone_number number(10) unique);
drop table facebookuser;
insert into facebookuser values(001, 'rohan.tuli@gmail.com', 'Rohan','Tuli',9876543210);
insert into facebookuser values(002, 'rahul.tuli@gmail.com', 'Rahul','Tuli',9876543211);
insert into facebookuser values(003, 'ayushman.anand@msn,com', 'Ayushman','Anand',9876543212);
insert into facebookuser values(004, 'rhea.gupta@hotmail.com', 'Rhea','Gupta',9876543213);
insert into facebookuser values(005, 'drashti.shah@yahoo.com', 'Drashti','Shah',9876543214);

select * from facebookuser;


create table contacts(user_id number(5) references facebookuser(facebook_id), first_name char(30), second_name char(30), friend_index varchar(10) primary key);
drop table contacts;
insert into contacts values(001, 'Ronak', 'Ranka', 101); 
insert into contacts values(001, 'Aakarsh', 'Sharma', 102); 
insert into contacts values(002, 'Harsh', 'Chawla', 201 ); 
insert into contacts values(002, 'Sidhhant', 'Kabra', 202); 
insert into contacts values(003, 'Varun', 'Nangrani', 301); 
insert into contacts values(003, 'Laksh Kataria', 'Ranka', 302); 
insert into contacts values(004, 'Vanshika', 'Gupta', 401); 
insert into contacts values(004, 'Anya', 'Jain', 402); 
select * from contacts;

alter table contacts rename column friend_index to friend_id;

delete from contacts  where friend_index = 402;




create table conversation(sender_id number(5) references facebookuser(facebook_ID), receiver_id number(5), title varchar(40));
insert into conversation values(001, 002, 'Work');
insert into conversation values(001, 004, 'Homework');
insert into conversation values(005, 003, 'Physics Project');
insert into conversation values(005, 001, 'Gossip');
insert into conversation values(003, 004, 'Dance workshop');
select * from conversation;

drop table conversation;
alter table conversation drop primary key


create table facebook_status(user_id number(5) references facebookuser(facebook_ID), first_name char(30), second_name char(30), date_posted date, post_id varchar(10) primary key);
drop table facebook_status;
insert into facebook_status values(001, 'Rohan', 'Tuli', to_date('7/10/2018', 'DD/MM/YY'), 'RT001');
insert into facebook_status values(003, 'Ayushman', 'Anand', to_date('10/10/2018', 'DD/MM/YY'), 'AA001');
insert into facebook_status values(001, 'Rohan', 'Tuli', to_date('11/10/2018', 'DD/MM/YY'), 'RT002');
insert into facebook_status values(003, 'Ayushman', 'Anand', to_date('15/10/2018', 'DD/MM/YY'), 'AA002');
insert into facebook_status values(005, 'Drashti', 'Shah', to_date('20/10/2018', 'DD/MM/YY'), 'DS001');

select * from facebook_status;

delete from facebook_status where user_id  = '001' and post_id = 'AA002';


create table photograph(user_id number(5) references facebookuser(facebook_ID),  photo_id varchar(10) primary key, photo_desc varchar(40), date_posted date);
drop table photograph;
insert into photograph values(001, 'RTp001' , 'Eiffel Tower', to_date('7/10/2017','DD/MM/YY'));
insert into photograph values(001, 'RTp002' , 'Champs Elysees', to_date('7/10/2017','DD/MM/YY'));
insert into photograph values(001, 'RTp003' , 'Lourve', to_date('7/10/2017','DD/MM/YY'));
insert into photograph values(003, 'AAp001' , 'Eagles nest', to_date('26/8/2017','DD/MM/YY'));
insert into photograph values(004, 'RGp001' , 'GT', to_date('13/10/2017','DD/MM/YY'));
insert into photograph values(005, 'DSp001' , 'Munich', to_date('2/6/2017','DD/MM/YY'));


select * from photograph


create table friends(user_id number(5) references facebookuser(facebook_ID) primary key, NumberOfFriends number(10));
drop table friends;
insert into friends values(001, 500);
insert into friends values(002, 575);
insert into friends values(003, 600);
insert into friends values(004, 670);
insert into friends values(005, 800);
select * from friends;


update facebookuser set phone_number = 9769104401 where facebook_ID = 1;

delete from photograph where photo_id = 'RTp002';


select facebookuser.facebook_ID, facebookuser.email, contacts.first_name , contacts.second_name from facebookuser inner join contacts on facebookuser.facebook_ID = contacts.user_id and facebookuser.facebook_ID = 1;


select facebookuser.facebook_id , facebookuser.first_name, friends.NumberOfFriends from facebookuser inner join friends on facebookuser.facebook_id = friends.user_id and NumberOfFriends > all(select NumberOfFriends from friends where user_id = 001 );


create view facebook_overview as select facebook_ID, email, first_name from facebookuser;

select * from facebook_overview;





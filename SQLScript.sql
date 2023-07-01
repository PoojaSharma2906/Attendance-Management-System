-- show databases;
drop database jdbc;
create database jdbc;
use jdbc;

create table users(user_id int unique auto_increment,name varchar(255),
email varchar(250) not null unique,Phoneno bigint,password varchar(255),Date_Created timestamp default current_timestamp,
Date_updated timestamp default current_timestamp,primary key(name)); 

create table login_details(login_id int primary key auto_increment,username varchar(250),password varchar(255),
role varchar(250) not null, constraint login_user foreign key(username) references users(name));
select * from login_details;

create table attendance(attendance_id int unique auto_increment,username varchar(255),ADate date,
constraint attendance_rule foreign key(username) references users(name),primary key(username,Adate)
);

create table leave_details(leave_id int primary key auto_increment,username varchar(255) unique not null,casual_leave int default 10 ,sick_leave int default 15,
earned_leave int default 15,constraint username_rule foreign key(username) references users(name));

create table leave_request(req_id int unique auto_increment,username varchar(255),ldate date,
is_approved bool default false,leave_type varchar(255),primary key(username,ldate),
constraint user_leave foreign key(username) references users(name));

/*select * from attendance;
drop table attendance;*/

/*insert into login_details(username,password,role) values("nobious123","12345","Admin");
desc login_details;
select * from login_details;
delete from login_details where username='poojasharma29';*/

-- drop table leave_details;
/*desc leave_details;
select * from  leave_details;*/

-- insert into leave_details(username) values("poojasharma29");

-- drop table leave_request;
/*select * from  leave_request;

use jdbc;
desc users;

update users set name="", email="", phoneno=888,password="", date_updated=current_timestamp() where name="nidhisharma";
update leave_request set username="" where username="nidhisharma";
update leave_details set username="" where username="nidhisharma";
update attendance set username=? where username=?;
update login_details set username=?, password=? where username=?;
*/

-- insert into leave_request values(1,"poojasharma29",curdate(),false,"sick Leave");
-- insert into leave_request values(2,"poojasharma29",curdate(),false,"sick Leave");-- error
-- insert into leave_request values(3,"poojasharma29",curdate(),false,"sick Leave");
-- select * from leave_request;
-- select * from leave_details;
-- drop table users;
-- insert into users(name,email,phoneno,password) values("nobious123","12345",987654321,"12345");
-- select * from users;
-- truncate users;
-- delete from login_details where username="poojasharma29";
-- select * from login_details;
-- drop table login_details; 
-- ALTER TABLE user_attendance DROP CONSTRAINT attendance;

/*
update leave_request set is_approved=false where username="poojasharma29";

set @cas=(select casual_leave from leave_details where username='poojasharma29'  );
update leave_details set casual_leave=@cas+1 where username='poojasharma29';


set @cas=(select casual_leave from leave_details where username=?  ) ;update leave_details set casual_leave=@cas+1 where username=?;

delimiter $$
start transaction;
set @cas:= (select casual_leave FROM leave_details where username='poojasharma29');  
update leave_details set casual_leave=@cas+1 where username='poojasharma29';
commit;
end $$;
delimiter ;

delimiter $$
create procedure approveRequest(uname varchar(255))
begin
set @cas:= (select casual_leave FROM leave_details where username=uname);  
update leave_details set casual_leave=@cas-1 where username=uname;	
commit;
end $$;
delimiter ;

call approveRequest("poojasharma29");
drop procedure approveRequest;

select * from leave_details;

select  strcmp("sick leave","SicK leve");
select "sick leave" = "Sick leave";


delimiter $$
create procedure approveLeave(uname varchar(255),ltype varchar(255))
begin
	set @casual:= (select casual_leave FROM leave_details where username=uname);  
	set @sick:= (select sick_leave FROM leave_details where username=uname);  
	set @paid:= (select earned_leave FROM leave_details where username=uname);  
  if ltype = "casual leave" and @casual>0 then
	update leave_details set casual_leave=@casual-1 where username=uname;	
	end if;
  if ltype = "sick leave" and @sick>0 then
	set @cas:= (select sick_leave FROM leave_details where username=uname);  
	update leave_details set sick_leave=@sick-1 where username=uname;	
	end if;
  if ltype = "paid leave" and @paid>0 then
	set @cas:= (select earned_leave FROM leave_details where username=uname);  
	update leave_details set earned_leave=@paid-1 where username=uname;	
	end if;
commit;
end $$;
delimiter ;

drop procedure approveLeave;

call approveLeave("poojasharma29","sick leave");
call approveLeave("poojasharma29","paid leave");
call approveLeave("poojasharma29","casual leave");

select * from leave_details;
update leave_details set casual_leave=0,sick_leave=0,earned_leave=0 where username="poojasharma29";

delimiter $$
create procedure disApproveLeave(uname varchar(255),ltype varchar(255))
begin
	set @casual:= (select casual_leave FROM leave_details where username=uname);  
	set @sick:= (select sick_leave FROM leave_details where username=uname);  
	set @paid:= (select earned_leave FROM leave_details where username=uname);  
  if ltype = "casual leave" and @casual<10 then
	set @cas:= (select casual_leave FROM leave_details where username=uname);  
	update leave_details set casual_leave=@casual+1 where username=uname;	
	end if;
  if ltype = "sick leave" and @sick<15 then
	set @cas:= (select sick_leave FROM leave_details where username=uname);  
	update leave_details set sick_leave=@sick+1 where username=uname;	
	end if;
  if ltype = "paid leave" and @paid<15 then
	set @cas:= (select earned_leave FROM leave_details where username=uname);  
	update leave_details set earned_leave=@paid+1 where username=uname;	
	end if;
commit;
end $$;
delimiter ;

drop procedure disapproveLeave;

call disapproveLeave("poojasharma29","sick leave");
call disapproveLeave("poojasharma29","paid leave");
call disapproveLeave("poojasharma29","casual leave");

select * from leave_details;
update leave_details set casual_leave=10,sick_leave=15,earned_leave=15 where username="poojasharma29";

truncate leave_details;
truncate leave_request;
truncate users;

select * from leave_details;


show tables;

*/
/*
2.no previous date leave apply
3.set leave amount admin

select * from users;
select * from login_details ;
select * from leave_details;
select * from attendance;
truncate leave_details;
*/

-- drop database jdbc; 
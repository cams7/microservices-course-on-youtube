delete from role;
delete from permission;
delete from permission_role;
delete from user;
delete from role_user;

alter table role auto_increment = 1;
alter table permission auto_increment = 1;
alter table permission_role auto_increment = 1;
alter table user auto_increment = 1;
alter table role_user auto_increment = 1;

delete from oauth_client_details;
delete from oauth_client_token;
delete from oauth_access_token;
delete from oauth_refresh_token;
delete from oauth_code;
delete from oauth_approvals;

/*password: abc123*/
insert into oauth_client_details (client_id, client_secret, web_server_redirect_uri, scope, access_token_validity, refresh_token_validity, resource_ids, authorized_grant_types, additional_information) values (
	'mobile', 
	'{bcrypt}$2a$10$.RGy2evh.oBI5NEXVDzSueuKf8fLwY6aVkDqwtivneTjQF4q4F/9K', 
	'http://localhost:8080/code', 
	'READ,WRITE', 
	'3600', 
	'10000', 
	'inventory,payment', 
	'authorization_code,password,refresh_token,implicit,client_credentials', 
	'{}'
);

insert into permission (name) values
	('create_profile'),
	('read_profile'),
	('update_profile'),
	('delete_profile');

insert into role (name) values ('ROLE_admin'),('ROLE_operator');

insert into permission_role (permission_id, role_id) values
	(1,1), /*create-> admin */
    (2,1), /* read admin */
    (3,1), /* update admin */
    (4,1), /* delete admin */
    (2,2),  /* read operator */
    (3,2);  /* update operator */

/*password: abc123*/	
insert into user (id, username,password, email, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked) values (
	'1', 
	'admin1',
	'{bcrypt}$2a$10$.uejCaxlKFuXQO8SDO78TeSYPoGH4hfWUYFD708PFvr5Cixp1H3Mi', 
	'k@krishantha.com', 
	'1', 
	'1', 
	'1', 
	'1'
);
insert into  user (id, username,password, email, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked) values (
	'2', 
	'user1', 
	'{bcrypt}$2a$10$zeIWWyX/AAq.QXwcORfHyOBrR7C8/AWKoUWNjjP6iAWzzN8YZgt3C',
	'k@krishantha.com', 
	'1', 
	'1', 
	'1', 
	'1'
);

insert into role_user (role_id, user_id) values
	(1, 1) /* krish-admin */,
    (2, 2) /* suranga-operatorr */ ;
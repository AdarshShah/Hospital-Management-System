create table if not exists 
	userstore (
			login varchar(20) primary key, 
            password varchar(20), 
            logintime timestamp, 
            role enum('administrator','pharmacist','diagnostitian')
		);

insert into userstore values('admin','pass',NULL,'administrator');
insert into userstore values('pharm','pass',NULL,'pharmacist');
insert into userstore values('diagn','pass',NULL,'diagnostitian');
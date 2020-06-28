create table patient(
	patient_id numeric primary key,
    patient_name varchar(15) NOT NULL,
    address varchar(50),
    age int(3),
    date_of_joining date,
    room_type enum('general','semi','single')
);


create table medicine(
	medicine_id numeric primary key,
    medicine_name varchar(20) not null,
    quantity_available numeric not null,
    rate numeric not null
);

insert into medicine values(101,"paracetamol",1000,5);
insert into medicine values(102,"eptoin",1000,10);
insert into medicine values(103,"azithromycin",1000,7);

create table diagnostic(
	test_id numeric primary key,
    test_name varchar(50) not null,
    rate numeric not null
);

insert into diagnostic values(201,"full_body_profile",1000);
insert into diagnostic values(202,"blood_pressure_test",300);
insert into diagnostic values(203,"diabetes_test",400);

create table patient_medicine(
	patient_id numeric references patient(patient_id) on delete cascade,
    medicine_id numeric references medicine(medicine_id) on delete cascade,
    quantity numeric not null
);

create table patient_diagnostic(
	patient_id numeric references patient(patient_id) on delete cascade,
    test_id numeric references diagnosic(test_id) on delete cascade
);
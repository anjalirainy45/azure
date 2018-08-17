create table country(id SERIAL primary key ,
	code varchar(10) not null,
	name varchar(30) not null);


create table player(id SERIAL primary key ,
	age integer not null,
	name varchar(80) not null);

create table teamtype(id SERIAL primary key ,
	name varchar(80) not null);

create table matchtype(id SERIAL primary key ,
	name varchar(80) not null);


create table team(id SERIAL primary key ,
	teamtype integer  REFERENCES teamtype(id),
	captain integer  REFERENCES player(id),
	wicketkepper integer REFERENCES player(id));
	
ALTER TABLE team
	ADD COLUMN teamname varchar(40) not null;
	
create table teamtypemapping(teamid integer REFERENCES team(id),
	playerid integer REFERENCES player(id));
	
create table match(id SERIAL primary key,
	matchtype integer REFERENCES matchtype(id),
	vengue varchar(30) not null,
	starttime date not null,
	tosswinner integer REFERENCES team(id),
	batfirst integer REFERENCES team(id));
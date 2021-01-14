create database galaxy_web_game;

/*Tables to save ships on the player's garage*/
create table lasers(
	laser_id int auto_increment primary key,
    laser_name varchar(25),
    laser_dmg int
);
create table minerals(
	mineral_id int auto_increment primary key,
    mineral_name varchar(25),
    mineral_weight double
);
create table ship_engine(
	engine_id int auto_increment primary key,
    engine_name varchar(25),
    engine_power int
);
create table ship_shield(
	shield_id int auto_increment primary key,
    shield_name varchar(25),
    shield_power int
);
create table ships(
	ship_id int auto_increment primary key,
    ship_laser_capacity int,
    ship_cargo_capacity double,
    engine_id int,
    laser_id int,
    shield_id int
);
create table ship_cargo(
	ship_cargo_id int auto_increment primary key,
    ship_id int,
    mineral_id int,
    mineral_quantity int,
    foreign key (ship_id) references ships(ship_id) on delete cascade,
    foreign key (mineral_id) references minerals(mineral_id) on delete cascade
);
create table ships_lasers(
	ships_lasers_id int auto_increment primary key,
    ship_id int,
    laser_id int,
    laser_quantity int,
    foreign key (ship_id) references ships(ship_id) on delete cascade,
    foreign key (laser_id) references lasers(laser_id) on delete cascade
);
/*User's garage*/
create table garages(
	garage_id int auto_increment primary key,
    ship_id int,
    foreign key (ship_id) references ships(ship_id) on delete cascade
);
create table settings(
	settings_id int auto_increment primary key,
    settings_volume float
);
create table stats(
	stat_id int auto_increment primary key,
    scrap double,
    settings_id int,
    garage_id int,
    foreign key (settings_id) references settings(settings_id) on delete cascade,
    foreign key (garage_id) references garages(garage_id) on delete cascade
);
create table users(
	user_id int auto_increment primary key,
    user_username varchar(50),
    user_password varchar(50),
    user_permission int,
    user_email varchar(100),
    stat_id int,
    foreign key (stat_id) references stats(stat_id) on delete cascade
);
/*Tables to save market information*/
create table sales(
	sale_id int auto_increment primary key,
    sale_item_name varchar(50),
	sale_item_quantity int,
    sale_price double
);
create table transactions(
	transaction_id int auto_increment primary key,
    transaction_date_time datetime,
    user_id int,
    sale_id int,
    foreign key (user_id) references users(user_id) on delete cascade,
    foreign key (sale_id) references sales(sale_id) on delete cascade
);
/*Tables to save user's mission*/
create table missions(
	mission_id int auto_increment primary key,
    mission_state int,
    mission_progress float,
    mission_name varchar(50),
    mission_description text,
    mission_reward double
);
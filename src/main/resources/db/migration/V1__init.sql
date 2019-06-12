create table user (
    usr_code       INT NOT NULL AUTO_INCREMENT,
    usr_name       VARCHAR(80) NOT NULL,
    usr_alias      VARCHAR(100) NOT NULL,
    usr_password   VARCHAR(80) NOT NULL,
    PRIMARY KEY (usr_code)
);

create table vehicle (
    vcl_code INT NOT NULL AUTO_INCREMENT,
    vcl_name VARCHAR(80) NOT NULL,
    vcl_plaque VARCHAR(8) NOT NULL,
    vlc_photo BLOB,
    PRIMARY KEY (vcl_code)
);

create table group_t (
    grp_code INT NOT NULL AUTO_INCREMENT,
    grp_name CHAR NOT NULL,
    grp_desc VARCHAR(20) NOT NULL,
    PRIMARY KEY (grp_code)
);

create table vehicle_group (
    vcl_code INT NOT NULL,
    grp_code INT NOT NULL,
    PRIMARY KEY(vcl_code, grp_code)
);

create table status (
    sts_code INT NOT NULL AUTO_INCREMENT,
    sts_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (sts_code)
);

create table vehicle_status (
    vcl_code INT NOT NULL,
    sts_code INT NOT NULL,
    PRIMARY KEY (vcl_code, sts_code)
);

alter table vehicle_group add constraint fk_r_01 foreign key (vcl_code)
    references vehicle (vcl_code) on delete restrict on update restrict;

alter table vehicle_group add constraint fk_r_02 foreign key (grp_code)
    references group_t (grp_code) on delete restrict on update restrict;

alter table vehicle_status add constraint fk_r_03 foreign key (vcl_code)
    references vehicle (vcl_code) on delete restrict on update restrict;

alter table vehicle_status add constraint fk_r_04 foreign key (sts_code)
    references status (sts_code) on delete restrict on update restrict;

insert into user (usr_name, usr_alias, usr_password) VALUES ("cmdrlias", "Larissa", "$2a$10$2XmoryKEpL8jrfy2anY4Wun.TseVwq8Dnxf/.xb5sUen5gFv0nJrO");

insert into group_t (grp_name, grp_desc) values ("A", "Econômicos");
insert into group_t (grp_name, grp_desc) values ("B", "Intermediário");
insert into group_t (grp_name, grp_desc) values ("C", "SUV");
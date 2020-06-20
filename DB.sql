/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  quan.vd173320
 * Created: Dec 23, 2019
 */
create database project1;
use project1;

/* tạo bảng */
create table category(
    cate_id int(10) auto_increment,
    name varchar(50),
    description varchar(100),
    primary key (cate_id)
);

create table user(
    user_id int(10) auto_increment,
    name varchar(50),
    password varchar(50),
    primary key (user_id)
);

create table word(
    word_id int(10) auto_increment,
    name varchar(50),
    mean varchar(50),
    cate_id int(10),
    user_id int(10),
    primary key (word_id)
);

/* tạo khóa ngoại */

alter table word
add constraint FK_word_user FOREIGN KEY (user_id) references user(user_id);

alter table word
add constraint FK_word_category FOREIGN KEY (cate_id) references category(cate_id);

/* chuyển định dạng cho các cột tiếng việt (dùng cho mysql do không có kiểu Nvarchar)*/
ALTER TABLE `word` CHANGE `mean` `mean` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL;

ALTER TABLE `category` CHANGE `description` `description` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL;

/* nhập dữ liệu kiểm thử */

insert into user(name, password)
value ('admin', 'admin');

insert into category(name, description)
values ('family', 'từ về gia đình'),
       ('animal', 'từ về động vật'),
       ('school', 'từ liên quan đến trường học'),
       ('Adverb', 'trạng từ hay');

insert into word(name, mean, cate_id, user_id)
values ('father','bố','1','1'),
       ('mother', 'mẹ','1','1'),
       ('nephew', 'cháu trai, cháu họ','1','1'),
       ('uncle', 'chú, bác ruột','1','1'),
       ('brother', 'anh trai','1','1'),
       ('lion', 'con sư tử','2','1'),
       ('tiger', 'con hổ','2','1'),
       ('zebra', 'con ngựa vằn','2','1'),
       ('donkey', 'con lừa','2','1'),
       ('principal', 'hiệu trưởng','3','1'),
       ('mathematics', 'môn toán','3','1'),
       ('geography', 'môn địa lý','3','1'),
       ('biology', 'môn sinh học','3','1'),
       ('teacher', 'cô giáo','3','1'),
       ('sometimes', 'thỉnh thoảng','4','1'),
       ('furthermore', 'hơn thế nữa','4','1'),
       ('everywhere', 'khắp mọi nơi','4','1'),
       ('enormously', 'cực kỳ','4','1'),
       ('remarkably','đáng kể','4','1');

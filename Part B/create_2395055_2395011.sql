drop schema if exists Listen_In cascade;
create schema Listen_In;
set search_path to Listen_In;
-- Hardas Lee 2395055 // Steeve Tassy 2395011

create table Artist
(
    artist_id        integer generated always as identity primary key,
    name             varchar(50) unique not null,
    birth_place      text
);

create table "User"
(
    user_id          integer generated always as identity primary key,
    password         text not null,
    username         varchar(16) unique not null,
    email            text unique not null
);

create table Tour
(
    tour_id          integer generated always as identity primary key,
    name             varchar(50) not null,
    date             text default now(),
    city             text not null,
    start_time       time default '19:00',
    featured_artist  integer references Artist (artist_id)
);

create table Record_Label
(
    record_id        integer generated always as identity primary key,
    name             text unique not null,
    address          text
);

create table Albums
(
    album_id         integer generated always as identity primary key,
    name             varchar(50) not null,
    release_date     text default now(),
    duration         text not null,
    record_id        integer references Record_Label (record_id),
    tour_id          integer references Tour (tour_id)

);

create table Producer
(
    producer_id      integer generated always as identity primary key,
    name             varchar(50) unique not null,
    email            varchar(50) unique

);

create table Song
(
    song_id          integer generated always as identity primary key,
    title            text not null,
    genre            varchar (16),
    duration         text not null,
    release_date     text default now(),
    tour_id          integer references Tour (tour_id)

);


create table Music_Video
(
    video_id         integer generated always as identity primary key,
    title            varchar(50),
    duration         text not null,
    release_date     text default now()

);

create table Featured_Artist
(
    artist_id        integer references Artist (artist_id) not null,
    song_id          integer references Song   (song_id)   not null

);


create table Song_Producer
(
    song_id          integer references Song     (song_id)     not null,
    producer_id      integer references Producer (producer_id) not null

);

create table Artist_Song
(
    artist_id        integer references Artist (artist_id) not null,
    song_id          integer references Song   (song_id)   not null

);

create table Artist_Producer
(
    artist_id        integer references Artist   (artist_id)   not null,
    producer_id      integer references Producer (producer_id) not null

);

create table Artist_Tour
(
    artist_id        integer references Artist (artist_id) not null,
    tour_id          integer references Tour   (tour_id)   not null

);

create table Artist_Albums
(
    artist_id        integer references Artist (artist_id) not null,
    album_id         integer references Albums (album_id)  not null

);

create table Artist_Record_Label
(
    artist_id        integer references    Artist    (artist_id) not null,
    record_id        integer references Record_Label (record_id) not null

);

create table Artist_Music_Video
(
    artist_id        integer references   Artist    (artist_id) not null,
    video_id         integer references Music_Video (video_id)  not null

);

create table Song_Albums
(
    song_id         integer references Song   (song_id)  not null,
    album_id        integer references Albums (album_id) not null

);

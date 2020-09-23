/* Creating DB if it doesn't exist */
select "create database email_sender" where not exists (select from pg_database where datname = "email_sender")\gexec

/* Accessing DB */
\c email_sender;

/* Creating Table */
create table emails (
    id serial not null,
    data timestamp not null default current_timestamp,
    subject varchar(100) not null,
    message varchar(250) not null
);

/* !!! IMPORTANT !!! The next step is only needed due to DBeaver DB access issues */
/* See more at https://github.com/dbeaver/dbeaver/issues/3361 */
/* Creating a User and giving some privileges */
create user postgres1 with encrypted password 'root';
grant connect on database email_sender to postgres1;
grant all on schema public to postgres1;
grant all on sequence public.emails_id_seq TO postgres1;
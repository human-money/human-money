CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
delete from transactions;
insert into transactions (destination_id, amount, inserted_at, updated_at) values (1, 1000000, now(), now())

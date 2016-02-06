CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
delete from transactions;
insert into transactions (id,to_public_key,to_address, amount,inserted_at,updated_at) values (uuid_generate_v4(),'11a18d74934293cf92fa754ffdb93fd04909ae468b4fdfda6af9db40358c2806','mason$mason.money', 50000000, NOW(), NOW());

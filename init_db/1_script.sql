create table if not exists tbl1
(
  id bigserial primary key,
  dt_txt varchar(255),
  string_txt varchar(255),
  null_txt varchar(255)
);

insert into tbl1
select data.id, case when data.id % 2 = 0 then now()::text else null end, case when data.id % 2 = 0 then 'test_string'::text else null end, null
from generate_series(1, 100000) as data(id);
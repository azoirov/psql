-- LIKE 
-- NOT LIKE
-- ILIKE
-- NOT ILIKE

-- = equals
-- != OR <> not equals
-- <
-- >
-- <=
-- >=

-- IN
-- IS NULL ISNULL
-- IS NOT NULL ISNOTNULL
-- BETWEEN
-- OR
-- AND

create table cities (
    id serial primary key,
    country_id int references countries(id)
)




select * from users where name like 'b_k%';
select * from users where name like '%r';

select * from users where name ilike 'a%';

select * from users where name = 'Asadbek';

-- && 
-- ||

-- HR

-- CITIES
    -- id
    -- name
    -- contry_id

-- CONTRIES
    -- id
    -- name

-- locations
    -- location_id
    -- street_address
    -- postal_code
    -- district
    -- city_id

-- department
   -- id
   -- name
   -- manager_id
   -- location_id

-- jobs
    -- id
    -- title
    -- min_salary 
    -- max_salary
 
-- employees
    -- id
    -- firstname
    -- lastname
    -- email
    -- phone_number
    -- hire_date
    -- job_id
    -- salary
    -- department_id int references departments(id)
    -- manager_id

-- job_history
    -- id
    -- employee_id
    -- start_date
    -- end_date
    -- department_id
    -- job_id

    -- sequelize
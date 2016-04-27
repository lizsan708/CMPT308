--Lizeth Sanchez
--Database Management
--Professor Rivas
--27 April 2016

--PreReqsFor--
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   numInput   int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select p.courseNum, p.preReqNum
      from   Prerequisites p, Courses c
      where  c.num = p.PreReqNum
      and    numInput = p.courseNum;
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(499, 'results');
Fetch all from results;


--IsPreReqFor--
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   numInput   int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select p.preReqNum, p.courseNum
      from   Prerequisites p, Courses c
      where  p.courseNum = c.num
      and    numInput = p.PreReqNum;
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqFor(120, 'results');
Fetch all from results;
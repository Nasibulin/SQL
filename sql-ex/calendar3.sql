SET DATEFIRST 2

declare @rdate datetime
select @rdate = '19410531'

declare @fd int , @bdate datetime

select  @bdate = dateadd(day,1-datepart(day,@rdate),@rdate)
select @fd = datepart(dw,@bdate)

--Вспомогательная таблица натуральных чисел - должна быть в каждой базе
declare @s table (d int)
insert into @s select 1
insert into @s select 2
insert into @s select 3
insert into @s select 4
insert into @s select 5
insert into @s select 6
insert into @s select 7
insert into @s select 8
insert into @s select 9
insert into @s select 10
insert into @s select 11
insert into @s select 12
insert into @s select 13
insert into @s select 14
insert into @s select 15
insert into @s select 16
insert into @s select 17
insert into @s select 18
insert into @s select 19
insert into @s select 20
insert into @s select 21
insert into @s select 22
insert into @s select 23
insert into @s select 24
insert into @s select 25
insert into @s select 26
insert into @s select 27
insert into @s select 28
insert into @s select 29
insert into @s select 30
insert into @s select 31





select t.d ,
	s1 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 1 then dateadd(dd,s.d,@bdate) else NULL end),
	s2 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 2 then dateadd(dd,s.d,@bdate) else NULL end),
	s3 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 3 then dateadd(dd,s.d,@bdate) else NULL end),
	s4 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 4 then dateadd(dd,s.d,@bdate) else NULL end),
	s5 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 5 then dateadd(dd,s.d,@bdate) else NULL end),
	s6 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 6 then dateadd(dd,s.d,@bdate) else NULL end),
	s7 = MAX(case when datepart(dw,dateadd(dd,s.d,@bdate)) = 7 then dateadd(dd,s.d,@bdate) else NULL end)
from @s s inner join 
	@s t on t.d= ceiling((s.d+@fd)/7.0)
where s.d <= datediff(day,@bdate, dateadd(day,-1,dateadd(month,1,@bdate)))+1
group by t.d
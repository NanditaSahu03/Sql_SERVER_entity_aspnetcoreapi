select * from employees
order by EmployeeId
offset 4 rows
fetch next 5 rows only




BEGIN
	DECLARE @Noofrowsperpage int=4,
	@TotalRows int,
	@Counter int=0
	select @TotalRows=count(*) from Employees
	--select @TotalRows
	WHILE(@Counter<=@TotalRows)
	    begin
	    select * from employees
		order by EmployeeId
		offset 0 rows
		fetch next @Noofrowsperpage rows only
		SET @Counter=@Counter+@Noofrowsperpage
		end
END
	    


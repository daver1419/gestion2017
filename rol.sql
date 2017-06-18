create procedure GARBAGE.getRoles
as
begin
	(select * from GARBAGE.Rol)
end
go

create procedure GARBAGE.getRolById(@rol_id int)
as
begin
	(select * from GARBAGE.Rol where rol_id= @rol_id)
end
go

create procedure GARBAGE.deleteRol(@rol_id int)
as 
begin
	update GARBAGE.Rol set rol_activo = 0 
	where rol_id = @rol_id
end
go

create type GARBAGE.FuncionalidadType as table(
	funcionalidad_id int not null
)
go

create procedure GARBAGE.createRol(@rol_nombre nvarchar(30), @funcionalidades GARBAGE.FuncionalidadType readonly)
as 
begin
	insert into GARBAGE.Rol(rol_nombre) values (@rol_nombre)
	
	declare @rol_id int
	set @rol_id = scope_identity()

	insert into GARBAGE.FuncionalidadxRol (func_rol_rol_id, func_rol_func_id) (
		select @rol_id, F.func_id
		from @funcionalidades as FUNC
		join GARBAGE.Funcionalidad F on F.func_id = FUNC.funcionalidad_id
	);

end
go
create procedure GARBAGE.getTurnoById(@turno_id int)
as
begin
	(select * from GARBAGE.Turno where turno_id = @turno_id)
end
go

create procedure GARBAGE.getAllTurnos
as
begin
	(select * from GARBAGE.Turno)
end
go 

create procedure GARBAGE.altaTurno(@turno_hora_inicio numeric(18,0) , @turno_hora_fin numeric(18,0), @turno_descripcion varchar(255) , @turno_valor_km numeric(18,2) , @turno_precio_base numeric(18,2) )
as
begin

	declare @error_message nvarchar(255)
	declare @cant int;
	
	set @cant = (select COUNT(*) from GARBAGE.TURNO 		where turno_hora_fin = @turno_hora_fin AND
	 	turno_hora_inicio = @turno_hora_inicio AND
	 	turno_valor_km = @turno_valor_km AND
	 	turno_precio_base = @turno_precio_base AND
	 	turno_descripcion = @turno_descripcion);

	if  @cant > 0 BEGIN
		set @error_message = 'El turno ya existe';
		throw 50000, @error_message , 1;
		
	END


	insert into GARBAGE.Turno(turno_hora_inicio , turno_hora_fin , turno_descripcion , turno_valor_km , turno_precio_base , turno_habilitado)
	values (@turno_hora_inicio, @turno_hora_fin, @turno_descripcion, @turno_valor_km, @turno_precio_base , 1)

	return 1;

end
go

create procedure GARBAGE.bajaLogicaTurno(@turno_id int)
as
begin
	
	update GARBAGE.Turno set turno_habilitado = 0
	where turno_id = @turno_id;
	RETURN 1

end


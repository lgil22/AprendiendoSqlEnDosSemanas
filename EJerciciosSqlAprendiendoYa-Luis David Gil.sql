	--Problema 2 - Crear una tabla (create table - sp_tables - sp_columns - drop table)

	-- Elimine la tabla "Carro" si existe
	 if object_ID('Carro') is not null
	  drop table Carro;

	-- Creacion de la tabla con el Nombre Carro
	  Create table  Carro(
	  Marca varchar(25),
	  Nombre varchar(35),
	  Matricula varchar(25),
	  Placa varchar(7)
	 );

	 --Ver la tabla
	 exec sp_tables @table_owner = 'dbo';

	 --ver la columna
	 exec sp_columns Carro;

	  --eliminar la tabla
	 drop table Carro;

	exec sp_tables @table_owner='dbo';


 ---Problema 3 Insertar y recuperar registros de una tabla (insert into - select)
	
	--eliminar la tabla si existe
	If object_id('agenda') is not null
	  drop table agenda;
	--creacion de la tabla agenda
	 create table agenda(
	  apellido varchar(30),
	  nombre varchar(20),
	  domicilio varchar(30),
	  telefono varchar(11)
	 );
	 --ver la tabla  @table_owner='dbo'
	 exec sp_tables @table_owner='dbo';
	 --ver la tabla sp_columns agenda
	 exec sp_columns agenda;
	 --insectar datos a la tabla
	 insert into agenda (apellido, nombre, domicilio, telefono)
	  values ('Luis','Gil','VillaTapia','8295092787');
	 insert into agenda (apellido,nombre,domicilio,telefono)
	  values ('Juan','perez','loscaimitos','8095881444');
	--consultar los datos de la tabla agenda
	 select * from agenda;
	 --elimina la tabla agenda
	 drop table agenda;
	 --eliminar la tabla agenda nueva vez
	/* drop table agenda;*/


	---Problema 4 tipos de datos básicos

	--eliminar la pelicula si existe
	If object_id('peliculas')is not null
	  Drop table peliculas;
	 --creacion de la tabla peliculas
	 Create table peliculas(
	  Nombre varchar(20),
	  Actor varchar(20),
	  Duracion integer,
	  Cantidad integer
	 );
	 --Se observa la columna peliculas
	 Exec sp_columns peliculas;
	 --insertar en la tabla peliculas
	 Insert into peliculas (nombre, actor, duracion, cantidad)
	 Values ('Mision Imposible','Tom Cruise',128,3);
	 Insert into peliculas (nombre, actor, duracion, cantidad)
	 Values ('Mision Imposible 2','Tom Cruise',130,2);
	 Insert into peliculas (nombre, actor, duracion, cantidad)
	 Values ('Mujer Bonita','Julia Roberts',118,3);
	 Insert into peliculas (nombre, actor, duracion, cantidad)
	 Values ('Elsa y Fred','China Zorrilla',110,2);
	  --consultar en la tabla peliculas
	 Select * from peliculas;


	--5 - recuperar algunos campos (select)

	--primer problema
	--elimina la tabla empleado si existe
	 if object_id('empleados') is not null
	  drop table empleados;
	  --crear la tabla empleados
	 create table empleados(
	  nombre varchar(20),
	  documento varchar(8), 
	  sexo varchar(1),
	  domicilio varchar(30),
	  sueldobasico float
	 );
	 --ver la columna empleado
	 exec sp_columns empleados;
	 --insertar datos en la tabla empleados
	 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
	  values ('juan juarez','22333444','M','sarmiento 123',500);
	 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
	  values ('ana acosta','27888999','f','colon 134',700);
	 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
	  values ('carlos caseres','31222333','m','urquiza 479',850);
	--consultar los datos empleados
	 select * from empleados;
	 --consultar los campos nombre, documento, domicilio de la tabla empleados
	 select nombre,documento,domicilio from empleados;
	 --consultar los campos documento sexo sueldobasico de la tabla empleados
	 select documento,sexo,sueldobasico from empleados;


	 ----Problema 6 recuperar algunos registros (where)

			--Si existe elimina la tabla libros
		If object_id('libros') is not null
		  drop table libros;
		--creacion d ela tabla libros
		 create table libros (
		  titulo varchar(20),
		  autor varchar(30),
		  editorial varchar(15)
		 );
		 --ver la comuna libros
		 exec sp_columns libros;

		 select *from libros;
		 --insertar en la tabla libros
		 insert into libros(titulo,autor,editorial) values
		  ('El Guerrero Azul','Simeon','Diario Libre');

		  insert into libros(titulo,autor,editorial) values
		  ('La Maravillas','Arturo Montero','Diario Libre');

		 insert into libros(titulo,autor,editorial) values
		  ('La Estampada','Jose Reyes','Diario Libre');
		 insert into libros(titulo,autor,editorial) values
		  ('Aprenda SQLServer YA','Marino Ortega','Santillana');

		 select * from libros
		  --consular el campo autor de la tabla libro donde autor es igual a Simeon
		  select autor from libros
		  where autor='Simeon';
		  --consular el campo titulo de la tabla libro donde editorial es igual a Santillana
		 select titulo from libros
		  where editorial='Santillana';
			--consular el campo editorial de la tabla libro donde titulo es igual a Las Maravillas del Universo
		 select editorial from libros
		  where titulo='La Maravillas'

	--- Problema 7 - Operadores Relacionales

		--Elimina la tabla películas si existe
		if object_id('peliculas') is not null
		  drop table peliculas;
		--creacion de la tabla peliculas
		 create table peliculas(
		  titulo varchar(20),
		  actor varchar(20),
		  duracion integer,
		  cantidad integer
		 );
		  exec sp_columns peliculas;
		--insertar en la tabla peliculas
		 insert into peliculas (titulo, actor, duracion, cantidad)
		  values ('mision imposible','tom cruise',120,3);
		 insert into peliculas (titulo, actor, duracion, cantidad)
		  values ('mision imposible 2','tom cruise',180,4);
		 insert into peliculas (titulo, actor, duracion, cantidad)
		  values ('mujer bonita','julia r.',90,1);
		 insert into peliculas (titulo, actor, duracion, cantidad)
		  values ('elsa y fred','china zorrilla',80,2);
		--consultar los datos de la tabla pelicualas donde la duración es menor o igual a 90
		 select * from peliculas
		  where duracion<=90;
		--consultar los datos de la tabla pelicualas donde el actor en diferente de tom cruise
		 select * from peliculas
		  where actor<>'tom cruise';
		  --consultar el titulo actor cantidad de la tabla pelicula donde la cantida ese mayor que 2
		 select titulo,actor,cantidad
		  from peliculas
		  where cantidad >2;


  
 --- Problema 8 - Borrar registros (delete)

	 --Si existe la tabla agenda se elimina
	If object_id('agenda') is not null
	  drop table agenda;

	--creacion de la tabla agenda
	 create table agenda(
	  apellido varchar(30),
	  nombre varchar(20),
	  domicilio varchar(30),
	  telefono varchar(11)
	 );
	 --insertar datos en la tabla
	 insert into agenda (apellido,nombre,domicilio,telefono)
	   values('alvarez','alberto','colon 123','4234567');
	 insert into agenda (apellido,nombre,domicilio,telefono)
	   values('juarez','juan','avellaneda 135','4458787');
	 insert into agenda (apellido,nombre,domicilio,telefono)
	   values('lopez','maria','urquiza 333','4545454');
	 insert into agenda (apellido,nombre,domicilio,telefono)
	   values('lopez','jose','urquiza 333','4545454');
	 insert into agenda (apellido,nombre,domicilio,telefono)
	   values('salas','susana','gral. Paz 1234','4123456');
	--eliminar los datos de la tabla agenda cuando el nombre es igua a juan
	 delete from agenda
	 where nombre='juan';
	 --eliminar los datos de la tabla agenda cuando el telefono en igual 4545454
	 delete from agenda
	 where telefono='4545454';
	 --consultar los datos de la tabla agenda
	 select * from agenda;
	 --elimina los datos de la tabla agenda
	 delete from agenda;
	 --consulta los datos de la tabla agenda
	 select * from agenda;


	---Problema 9 - Actualizar registros (update)

		 --Si existe se elimina la tabla agenda
		 if object_id('agenda') is not null
		  drop table agenda;
		--creacion de la tabla agenda
		 create table agenda(
		  apellido varchar(30),
		  nombre varchar(20),
		  domicilio varchar(30),
		  telefono varchar(11)
		 );
		 --insertar datos en la tabla agenda
		 insert into agenda (apellido,nombre,domicilio,telefono)
		  values ('acosta','alberto','colon 123','4234567');
		 insert into agenda (apellido,nombre,domicilio,telefono)
		  values ('juarez','juan','avellaneda 135','4458787');
		 insert into agenda (apellido,nombre,domicilio,telefono)
		  values ('lopez','maria','urquiza 333','4545454');
		 insert into agenda (apellido,nombre,domicilio,telefono)
		  values ('lopez','jose','urquiza 333','4545454');
		 insert into agenda (apellido,nombre,domicilio,telefono)
		  values ('suarez','susana','gral. Paz 1234','4123456');
		--consultar los datos de la tabla agenda
		 select * from agenda;
		 --actializar la tabla agenda
		 update agenda set nombre='juan jose'
		  where nombre='juan';
		--consultar los datos de la tabla agenda
		 select * from agenda;
		 --actulizar la tabla agenda
		 update agenda set telefono='4445566'
		  where telefono='4545454';
		--consultar los datos de la tabla agenda
		 select * from agenda;
		 ---actualizar el nombre de la tabla agenda 
		 update agenda set nombre='juan jose'
		  where nombre='juan';
		--consultar los datos de la tabla agenda
		 select * from agenda;

 ---Problema 11 - Valores null (is null)

			if object_id('medicamentos') is not null
		   drop table medicamentos;
		go
		create table medicamentos(
		  codigo integer not null,
		  nombre varchar(20) not null,
		  laboratorio varchar(20),
		  precio float,
		  cantidad integer not null
		);
		go
		exec sp_columns medicamentos
		go
		insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(1,'Aceptaminophen',null,null,10); 
		insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(2,'Sertal compuesto',null,8.90,150);
		go
		insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Aspirinas','',0,150);
		insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(0,'','Bayer',15.60,0);
		select *from medicamentos
		go
		insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(null,'Amoxidal jarabe','Bayer',25,120);
		go
		select codigo, nombre from medicamentos
		where precio is null
		go
		select codigo, laboratorio from medicamentos
		where precio is null
		go
		select * from medicamentos
		where laboratorio=''
		go
		select * from medicamentos
		  where laboratorio<>'';
		go
		select * from medicamentos
		where laboratorio is not null;
		go
		select * from medicamentos
		where precio<>0;
		go
		select * from medicamentos
		where precio is not null
		go

	--Problema 13 - Campo con atributo Identity
		 if object_id('medicamentos') is not null
		  drop table medicamentos;

		 create table medicamentos(
		  codigo int identity,
		  nombre varchar(20) not null,
		  laboratorio varchar(20),
		  precio float,
		  cantidad integer
		 );
		 go
		 exec sp_columns medicamentos;
		 Go
		 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
		 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
		 Go
		 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);
		 Go
		 update medicamentos set codigo=5
		  where nombre='Bayaspirina';
		Go
		delete from medicamentos
		where codigo=3;
		Go
		insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);
		Go
		select * from medicamentos;
		Go

	---Problema 14 - Otras características del atributo Identity
		if object_id('medicamentos') is not null
		  drop table medicamentos;

		 create table medicamentos(
		  codigo integer identity(10,1),
		  nombre varchar(20) not null,
		  laboratorio varchar(20),
		  precio float,
		  cantidad integer
		 );
		 Go
		 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxicilina','Roche',5.2,100);
		 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Aceptaminophen','Roche',4.10,200);
		 Go
		 select * from medicamentos;
		 Go
		 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);
		 Go
		 set identity_insert medicamentos on;
		 go
		 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);
		 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(10,'Amoxilina 500','Bayer',15.60,100);
		Go
		select IDENT_SEED('medicamentos');
		select IDENT_INCR('medicamentos');
		Go

		---Problema 15 - Truncate table
		if object_id('alumnos') is not null
		drop table alumnos;

		create table alumnos(
		  legajo int identity,
		  documento varchar(8),
		  nombre varchar(30),
		  domicilio varchar(30)
		);
		 Go
		 insert into alumnos (documento,nombre,domicilio) values('20170305','Maria Mariana','Duarte 21');
		 insert into alumnos (documento,nombre,domicilio) values('20159636','Morales Marcos','Cristo Rey');
		 Go
		 delete from alumnos
		 Go
		 insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
		 insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
		 Go
		 select * from alumnos;
		 Go
		 truncate table alumnos;
		insert into alumnos (documento,nombre,domicilio) values('20170305','Maria Mariana','Duarte 21');
		insert into alumnos (documento,nombre,domicilio) values('20159636','Morales Marcos','Cristo Rey');
		Go
		select *from alumnos;
		Go

		--- Problema 17 - Tipo de dato (texto)
		 if object_id('autos') is not null
		  drop table autos;

		 create table autos(
		  patente char(6),
		  marca varchar(20),
		  modelo char(4),
		  precio float,
		  primary key (patente)
		 );
		Go
		insert into autos values('ACD123','Fiat 128','1970',15000);
		insert into autos values('ACG234','Renault 11','1990',40000);
		insert into autos values('BCD333','Peugeot 505','1990',80000);
		Go
		Select * from autos
		Where modelo='1990';
		Go

		---Problema 18 - Tipo de dato (numérico)
		 if object_id('cuentas') is not null
		  drop table cuentas;
		Go
		 Create table cuentas(
		  numero int not null,
		  documento char(8),
		  nombre varchar(30),
		  saldo money,
		  primary key (numero)
		 );
		 Go
		insert into cuentas(numero,documento,nombre,saldo) values('1234','25666777','Pedro Perez',500000.60);
		insert into cuentas(numero,documento,nombre,saldo) values('2234','27888999','Juan Lopez',-250000);
		insert into cuentas(numero,documento,nombre,saldo) values('3344','27888999','Juan Lopez',4000.50);
		insert into cuentas(numero,documento,nombre,saldo) values('3346','32111222','Susana Molina',1000);
		Go
		select * from cuentas
		where saldo<4000;
		Go
		select numero,saldo from cuentas
		where nombre='Juan Lopez';
		Go
		select * from cuentas
		where saldo<0;
		Go
		select * from cuentas
		where numero>=3000;
		Go

		---Problema 19 - Tipo de dato (fecha y hora)
		if object_id('alumnos') is not null
		  drop table alumnos;

		 create table alumnos(
		  apellido varchar(30),
		  nombre varchar(30),
		  documento char(8),
		  domicilio varchar(30),
		  fechaingreso datetime,
		  fechanacimiento datetime
		 );

		 set dateformat 'dmy';

		 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');
		 insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');
		 Go
		 select * from alumnos where fechaingreso<'1-1-91';
		 select * from alumnos where fechanacimiento is null;
		 insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null);
		 set dateformat 'mdy';
		 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
		 select *from alumnos;
		 Go
 
		 --- Problema 20 - Ingresar algunos campos (insert into)
		 if object_id('cuentas') is not null
		  drop table cuentas;

		create table cuentas(
		  numero int identity,
		  documento char(8) not null,
		  nombre varchar(30),
		  saldo money
		 );
		Go
		insert into cuentas values ('25666777','Juan Perez',2500.50);
		insert into cuentas values (1,'25666777','Juan Perez',2500.50);
		insert into cuentas (documento,saldo) values ('28999777',-5500);
		Go
		select *from cuentas ;
		Go

		---Problema 21 - Valores por defecto (default)

		 if object_id('visitantes') is not null
		  drop table visitantes;

		 create table visitantes(
		  nombre varchar(30),
		  edad tinyint,
		  sexo char(1) default 'f',
		  domicilio varchar(30),
		  ciudad varchar(20) default 'Cordoba',
		  telefono varchar(11),
		  mail varchar(30) default 'no tiene',
		  montocompra decimal (6,2)
		 );
		 Go
		 exec sp_columns visitantes;
		 Go
		 insert into visitantes (nombre, domicilio, montocompra) values ('Susana Molina','Colon 123',59.80);
		 insert into visitantes (nombre, edad, ciudad, mail) values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
		 Go
		 select *from visitantes;
		 Go
		 insert into visitantes values ('Marcelo Morales',38,default,default,default,'4255232','marcelomorales@hotmail.com',default);
		 insert into visitantes default values;
		 Go
		 select * from visitantes;
		 Go
 
		 --- Problema 22 - Columnas calculadas (operadores aritméticos y de concatenación)
		 if object_id ('articulos') is not null
		 drop table articulos;

		 create table articulos(
		  codigo int identity,
		  nombre varchar(20),
		  descripcion varchar(30),
		  precio smallmoney,
		  cantidad tinyint default 0,
		  primary key (codigo)
		 );
		 Go
		 insert into articulos (nombre, descripcion, precio,cantidad) values ('impresora','Epson Stylus C45',400.80,20);
		 insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500);
		 Go
		 update articulos set precio=precio+(precio*0.15);
		 select * from articulos;
		 select nombre+','+descripcion from articulos;
		 update articulos set cantidad=cantidad-5
		 where nombre='teclado';

		 select * from articulos;
		 Go

		 --- Problema 23 - Alias
		 if object_id ('libros') is not null
		  drop table libros;

		 create table libros(
		  codigo int identity,
		  titulo varchar(40) not null,
		  autor varchar(20) default 'Desconocido',
		  editorial varchar(20),
		  precio decimal(6,2),
		  cantidad tinyint default 0,
		  primary key (codigo)
		 );
		 Go
		 insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
		 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
		 insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
		 Go
		 select titulo, autor,editorial,precio,cantidad,precio*cantidad as 'monto total' from libros;
		 select titulo,autor,precio, precio*0.1 as descuento, precio-(precio*0.1) as 'precio final' from libros
		 where editorial='Emece';
		 Go
		select titulo+'-'+autor as "Título y autor" from libros;
		Go

		--- Problema 27 - Funciones para el uso de fechas y horas

		if object_id ('empleados') is not null
		  drop table empleados;

		create table empleados(
		  nombre varchar(30) not null,
		  apellido varchar(20) not null,
		  documento char(8),
		  fechanacimiento datetime,
		  fechaingreso datetime,
		  sueldo decimal(6,2),
		  primary key(documento)
		 );
		 Go
		 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
		 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
		 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
		 Go
		 select nombre+space(1)+upper(apellido) as nombre,
		 stuff(documento,1,0,'DNI N') as documento,
		 stuff(sueldo,1,0,'$') as sueldo from empleados;

		 select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;

		 select nombre,apellido from empleados
		  where datename(month,fechanacimiento)='october';

		 select nombre, apellido from empleados
		 where DATEPART(year, fechaingreso) = 2000;
		  Go
  
		 --- Problema 28 - Ordenar registros (order by)
		 if object_id('visitas') is not null
		  drop table visitas;

		create table visitas (
		  numero int identity,
		  nombre varchar(30) default 'Anonimo',
		  mail varchar(50),
		  pais varchar (20),
		  fecha datetime,
		  primary key(numero)
		);

		insert into visitas (nombre,mail,pais,fecha) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
		insert into visitas (nombre,mail,pais,fecha) values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
		insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');

		Go
		select *from visitas
		order by fecha desc;
		Go
		select nombre, pais, DATENAME(MONTH, fecha) from visitas
		order by pais, Datename(month, fecha) desc;
		Go

		select nombre, pais,
		DATENAME(hour, fecha) hora ,
		dateName(month, fecha) mes,
		DateName(day, fecha) dia
		from visitas order by 1,2,3;
		go
		select mail, pais
		from visitas
		where datename(month,fecha)='October'
		order by 2;
		Go

		--- Problema 29 - Operadores lógicos ( and - or - not)
		if object_id('medicamentos') is not null
		  drop table medicamentos;
		Go
		create table medicamentos(
		  codigo int identity,
		  nombre varchar(20),
		  laboratorio varchar(20),
		  precio decimal(5,2),
		  cantidad tinyint,
		  primary key(codigo)
		 );
		Go
		 insert into medicamentos values('Sertal','Roche',5.2,100);
		 insert into medicamentos values('Buscapina','Roche',4.10,200);
		 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100);
		Go
		select codigo,nombre
		  from medicamentos
		  where laboratorio='Roche' and
		  precio<5;
		Go
		 select * from medicamentos
		  where laboratorio='Roche' or
		  precio<5;
		Go
		 select * from medicamentos
		  where not laboratorio='Bayer' and
		  cantidad=100;
		Go
		 select * from medicamentos
		  where laboratorio='Bayer' and
		  not cantidad=100;
		Go
		 delete from medicamentos
		  where laboratorio='Bayer' and
		  precio>10;
		Go
		 update medicamentos set cantidad=200
		  where laboratorio='Roche' and
		  precio>5;
		Go
		 delete from medicamentos
		  where laboratorio='Bayer' or
		  precio<3;
		Go

		--- Problema 30 - Otros operadores relacionales (is null)
		if object_id('peliculas') is not null
		  drop table peliculas;
		Go
		create table peliculas(
		  codigo int identity,
		  titulo varchar(40) not null,
		  actor varchar(20),
		  duracion tinyint,
		  primary key (codigo)
		 );
		 Go
		 insert into peliculas values('Mision imposible','Tom Cruise',120);
		 insert into peliculas values('Harry Potter y la piedra filosofal','Daniel R.',null);
		 insert into peliculas values('Harry Potter y la camara secreta','Daniel R.',190);
		Go
		select * from peliculas
		  where actor is null;
		Go
		 update peliculas set duracion=0
		  where duracion is null;
		Go
		 delete from peliculas
		  where actor is null and
		  duracion=0;
		Go
		select * from peliculas;
		Go

		--- Problema 31 - Otros operadores relacionales (between)
		if object_id('visitas') is not null
		  drop table visitas;
		Go
		 create table visitas (
		  numero int identity,
		  nombre varchar(30) default 'Anonimo',
		  mail varchar(50),
		  pais varchar (20),
		  fechayhora datetime,
		  primary key(numero)
		);
		Go
		 insert into visitas (nombre,mail,pais,fechayhora) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
		 insert into visitas (nombre,mail,pais,fechayhora) values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
		 insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
		 Go
		 select * from visitas
		 where fechayhora between '2006-09-12' and '2006-10-11';
		Go
		 select * from visitas
		  where numero between 2 and 5;
		  Go

		--- Problema 32 - Otros operadores relacionales (in)
		select nombre,precio from medicamentos
		  where laboratorio in ('Bayer','Bago');
		Go
		 select * from medicamentos
		  where cantidad between 1 and 5;
		Go
		 select * from medicamentos
		  where cantidad in (1,2,3,4,5);
		Go
		--- Problema 33 - Búsqueda de patrones (like - not like)

		 if object_id('empleados') is not null
		  drop table empleados;
		Go
		 create table empleados(
		  nombre varchar(30),
		  documento char(8),
		  domicilio varchar(30),
		  fechaingreso datetime,
		  seccion varchar(20),
		  sueldo decimal(6,2),
		  primary key(documento)
		 );
		 Go
		 insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
		 insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
		 insert into empleados  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
		 insert into empleados  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
		 Go

		 select * from empleados
		  where nombre like '%Perez%';
		Go
		 select * from empleados
		  where domicilio like 'Co%8%';
		Go
		 select * from empleados
		  where documento like '%[02468]';
		Go
		 select * from empleados
		  where documento like '[^13]%' and
		  nombre like '%ez';
		Go
		 select nombre from empleados
		  where nombre like '%[yj]%';
		Go
		 select nombre,seccion from empleados
		  where seccion like '[SG]_______';
		Go
		 select nombre,seccion from empleados
		  where seccion not like '[SG]%';
		Go
		 select nombre,sueldo from empleados
		  where sueldo not like '%.00';
		Go
		 select * from empleados
		 where fechaingreso like '%1990%';

		 Go

		 --- Problema 34 - Contar registros (count)
		  select count(*) from medicamentos;
		Go
		select count(laboratorio) from medicamentos;
		Go
		 select count(precio) as 'Con precio',
		  count(cantidad) as 'Con cantidad'
		  from medicamentos;
		Go
		 select count(precio)
		  from medicamentos
		  where laboratorio like 'B%';
		Go
 
		 --- Problema 35 - Contar registros (count_big)
		select count_big(*)
		  from medicamentos;

		 select count_big(distinct laboratorio)
		   from medicamentos;

		 select count_big(precio) as 'Con precio',
		  count_big(cantidad) as 'Con cantidad'
		  from medicamentos;

		--- Problema 36 - Funciones de agrupamiento (count - sum - min - max - avg)
		if object_id('empleados') is not null
		  drop table empleados;
		Go
		 create table empleados(
		  nombre varchar(30),
		  documento char(8),
		  domicilio varchar(30),
		  seccion varchar(20),
		  sueldo decimal(6,2),
		  cantidadhijos tinyint,
		  primary key(documento)
		 );
		 Go
		 insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
		 insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
		 insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
		 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
		 Go
		 select count(*)
		  from empleados;
		Go
		 select count(sueldo)
		  from empleados
		  where seccion='Secretaria';
		Go
		select max(sueldo) as 'Mayor sueldo' from empleados
		where seccion = 'Secretaria';
		Go
		 select max(cantidadhijos)
		  from empleados
		  where nombre like '%Perez%';
		Go
		 select avg(sueldo)
		  from empleados;
		Go
		 select avg(sueldo)
		  from empleados
		  where seccion='Secretaria';
		Go
		 select avg(cantidadhijos)
		  from empleados
		  where seccion='Sistemas';
		  Go

		  --- Problema 37 - Agrupar registros (group by)
		 if object_id('visitantes') is not null
		  drop table visitantes;
		  Go
		 create table visitantes(
		  nombre varchar(30),
		  edad tinyint,
		  sexo char(1) default 'f',
		  domicilio varchar(30),
		  ciudad varchar(20) default 'Cordoba',
		  telefono varchar(11),
		  mail varchar(30) default 'no tiene',
		  montocompra decimal (6,2)
		 );

		 Go
		 insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
		 insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
		 insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
		 Go
		 select ciudad, count(*) from visitantes group by ciudad;
		 Go
		 select ciudad, count(telefono) from visitantes group by ciudad;
		 Go
		 select sexo, sum(montocompra) from visitantes group by sexo;
		 Go
		 select sexo,ciudad,
		  max(montocompra) as mayor,
		  min(montocompra) as menor
		  from visitantes
		  group by sexo,ciudad;

		 select ciudad, avg(montocompra) as 'promedio de compras' from visitantes
		  group by ciudad;

		 select ciudad, count(*) as 'cantidad con mail' from visitantes
		  where mail is not null and
		  mail<>'no tiene'
		  group by ciudad;

		Go

		--- Problema 38 - Seleccionar grupos (having)
		 if object_id('clientes') is not null
		  drop table clientes;
		Go
		 create table clientes (
		  codigo int identity,
		  nombre varchar(30) not null,
		  domicilio varchar(30),
		  ciudad varchar(20),
		  provincia varchar (20),
		  telefono varchar(11),
		  primary key(codigo)
		);
		Go
		 insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
		 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
		 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
		 Go
		 select ciudad, provincia,
		  count(*) as cantidad
		  from clientes
		  group by ciudad,provincia;
		Go
		 select ciudad, provincia,
		  count(*) as cantidad
		  from clientes
		  group by ciudad,provincia
		  having count(*)>1;
		Go
		 select ciudad, count(*) from clientes
		  where domicilio like '%San Martin%' 
		  group by all ciudad
		  having count(*)<2 and
		  ciudad <> 'Cordoba';
		Go

		 --- Problema 39 - Registros duplicados (distinct)
		select distinct provincia from clientes;
		Go
		 select count(distinct provincia) as cantidad from clientes;
		Go
		 select distinct ciudad from clientes; 
		 Go
		 select count(distinct ciudad) from clientes;
		Go
		 select distinct ciudad from clientes
		  where provincia='Cordoba';
		GO
		 select provincia,count(distinct ciudad) from clientes
		 group by provincia;
		 Go

		 --- Problema 40. Cláusula top
		if object_id('empleados') is not null
		  drop table empleados;

		 create table empleados (
		  documento varchar(8) not null,
		  nombre varchar(30),
		  estadocivil char(1),
		  seccion varchar(20)
		 );
		 Go
		 insert into empleados values ('22222222','Alberto Lopez','c','Sistemas');
		 insert into empleados values ('23333333','Beatriz Garcia','c','Administracion');
		 insert into empleados values ('24444444','Carlos Fuentes','s','Administracion');
		 Go
		 select top 2 * from empleados;
		 Go
		 select top 4 nombre,seccion from empleados
		 order by seccion;
		 Go
		 select top 4 with ties nombre,seccion from empleados
		 order by seccion;
		 Go
		 select top 4 nombre,estadocivil,seccion from empleados
		 order by estadocivil,seccion;
		 Go
		 select top 4 with ties nombre,estadocivil,seccion from empleados
		 order by estadocivil,seccion;
		 Go

		 --- Problema 40. Eliminar restricciones (alter table - drop)
		  if object_id('vehiculos') is not null
		  drop table vehiculos;
		Go
		 create table vehiculos(
		  patente char(6) not null,
		  tipo char(1),--'a'=auto, 'm'=moto
		  horallegada datetime not null,
		  horasalida datetime
		 );
		Go
		 alter table vehiculos
		 add constraint CK_vehiculos_tipo
		 check (tipo in ('a','m'));
		 Go
		 alter table vehiculos
		  add constraint DF_vehiculos_tipo
		  default 'a'
		  for tipo;
		Go
		 alter table vehiculos
		  add constraint CK_vehiculos_patente_patron
		  check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');
		Go
		 alter table vehiculos
		  add constraint PK_vehiculos_patentellegada
		  primary key(patente,horallegada);
		Go
		 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);
		 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);
		 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);
		Go
		 exec sp_helpconstraint vehiculos;
		Go
		 alter table vehiculos
		  drop DF_vehiculos_tipo;
		Go
		 exec sp_helpconstraint vehiculos;
		 Go
		 alter table vehiculos
		 drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;
		 Go
		 exec sp_helpconstraint vehiculos;
		 Go

		 --- Problema 42. Combinación interna (inner join)
		 if (object_id('clientes')) is not null
		   drop table clientes;
		Go
		  if (object_id('provincias')) is not null
		   drop table provincias;
		Go
		 create table clientes (
		  codigo int identity,
		  nombre varchar(30),
		  domicilio varchar(30),
		  ciudad varchar(20),
		  codigoprovincia tinyint not null,
		  primary key(codigo)
		 );
		 Go
		 create table provincias(
		  codigo tinyint identity,
		  nombre varchar(20),
		  primary key (codigo)
		 );
		 Go
		 insert into provincias (nombre) values('Cordoba');
		 insert into provincias (nombre) values('Santa Fe');
		 insert into provincias (nombre) values('Corrientes');
		 Go
		 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
		 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
		 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
		 Go
		  select c.nombre,domicilio,ciudad,p.nombre
		  from clientes as c
		  join provincias as p
		  on c.codigoprovincia=p.codigo;
		Go
		 select c.nombre,domicilio,ciudad,p.nombre
		  from clientes as c
		  join provincias as p
		  on c.codigoprovincia=p.codigo
		  order by p.nombre;
		Go
		 select c.nombre,domicilio,ciudad
		  from clientes as c
		  join provincias as p
		  on c.codigoprovincia=p.codigo
		  where p.nombre='Santa Fe';
		Go

		--- Problema 43- Combinación externa izquierda (left join)
		if (object_id('clientes')) is not null
		   drop table clientes;
		Go
		  if (object_id('provincias')) is not null
		   drop table provincias;
		Go
		 create table clientes (
		  codigo int identity,
		  nombre varchar(30),
		  domicilio varchar(30),
		  ciudad varchar(20),
		  codigoprovincia tinyint not null,
		  primary key(codigo)
		 );
		 Go
		 create table provincias(
		  codigo tinyint identity,
		  nombre varchar(20),
		  primary key (codigo)
		 );

		 insert into provincias (nombre) values('Cordoba');
		 insert into provincias (nombre) values('Santa Fe');
		 insert into provincias (nombre) values('Corrientes');

		 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
		 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
		 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
		 Go
		select c.nombre,domicilio,ciudad, p.nombre
		  from clientes as c
		  left join provincias as p
		  on codigoprovincia = p.codigo;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from provincias as p
		  left join clientes as c
		  on codigoprovincia = p.codigo;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from clientes as c
		  left join provincias as p
		  on codigoprovincia = p.codigo
		  where p.codigo is not null;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from clientes as c
		  left join provincias as p
		  on codigoprovincia = p.codigo
		  where p.codigo is null
		  order by c.nombre;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from clientes as c
		  left join provincias as p
		  on codigoprovincia = p.codigo
		  where p.nombre='Cordoba';
		Go

		--- Problema 44.Combinación externa derecha (right join)
		 select c.nombre,domicilio,ciudad, p.nombre
		  from provincias as p
		  right join clientes as c
		  on codigoprovincia = p.codigo;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from clientes as c
		  left join provincias as p
		  on codigoprovincia = p.codigo;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from provincias as p
		  right join clientes as c
		  on codigoprovincia = p.codigo
		  where p.codigo is not null;
		Go
		 select c.nombre,domicilio,ciudad, p.nombre
		  from provincias as p
		  right join clientes as c
		  on codigoprovincia = p.codigo
		  where p.codigo is null
		  order by ciudad;

		--- Problema 45.Combinación externa completa (full join)
		if (object_id('deportes')) is not null
		drop table deportes;
		Go
		 if (object_id('inscriptos')) is not null
		drop table inscriptos;
		Go
		 create table deportes(
		  codigo tinyint identity,
		  nombre varchar(30),
		  profesor varchar(30),
		  primary key (codigo)
		 );
		 create table inscriptos(
		  documento char(8),
		  codigodeporte tinyint not null,
		  matricula char(1) --'s'=paga 'n'=impaga
		 );
		Go
		 insert into deportes values('tenis','Marcelo Roca');
		 insert into deportes values('natacion','Marta Torres');
		 insert into deportes values('basquet','Luis Garcia');
		Go 
		 insert into inscriptos values('22222222',3,'s');
		 insert into inscriptos values('23333333',3,'s');
		 insert into inscriptos values('24444444',3,'n');
 
		Go
		 select documento,d.nombre,matricula
		  from inscriptos as i
		  join deportes as d
		  on codigodeporte=codigo;
		Go
		 select documento,d.nombre,matricula
		  from inscriptos as i
		  left join deportes as d
		  on codigodeporte=codigo;
		Go
		 select documento,d.nombre,matricula
		  from deportes as d
		  right join inscriptos as i
		  on codigodeporte=codigo;
		Go
		 select nombre
		  from deportes as d
		  left join inscriptos as i
		  on codigodeporte=codigo
		  where codigodeporte is null;
		Go
		 select documento
		  from inscriptos as i
		  left join deportes as d
		  on codigodeporte=codigo
		  where codigo is null;
		Go
		 select documento,nombre,profesor,matricula
		  from inscriptos as i
		  full join deportes as d
		  on codigodeporte=codigo; 
		Go

		--- Problema 46. Combinaciones cruzadas (cross join)
		 if object_id('mujeres') is not null
		  drop table mujeres;
		GO
		 if object_id('varones') is not null
		  drop table varones;
		Go
		 create table mujeres(
		  nombre varchar(30),
		  domicilio varchar(30),
		  edad int
		 );
		Go
		 create table varones(
		  nombre varchar(30),
		  domicilio varchar(30),
		  edad int
		 );
		GO
		 insert into mujeres values('Maria Lopez','Colon 123',45);
		 insert into mujeres values('Liliana Garcia','Sucre 456',35);
		 insert into mujeres values('Susana Lopez','Avellaneda 98',41);
		 Go
		 insert into varones values('Juan Torres','Sarmiento 755',44);
		 insert into varones values('Marcelo Oliva','San Martin 874',56);
		 insert into varones values('Federico Pereyra','Colon 234',38);
		 insert into varones values('Juan Garcia','Peru 333',50);
		Go
		 select m.nombre,m.edad,v.nombre,v.edad
		  from mujeres as m
		  cross join varones as v;
		Go
		 select m.nombre,m.edad,v.nombre,v.edad
		  from mujeres as m
		  cross join varones as v
		  where m.edad>40 and
		  v.edad>40;
		Go
		 select m.nombre,m.edad,v.nombre,v.edad
		  from mujeres as m
		  cross join varones as v
		  where m.edad-v.edad between -10 and 10;
		  Go

		  --- Problema 47. Combinación de más de dos tablas
		 if object_id('socios') is not null
		  drop table socios;
		Go
		 if object_id('deportes') is not null
		  drop table deportes;
		Go
		 if object_id('inscriptos') is not null
		  drop table inscriptos;
		Go
		 create table socios(
		  documento char(8) not null, 
		  nombre varchar(30),
		  domicilio varchar(30),
		  primary key(documento)
		 );
		Go
		 create table deportes(
		  codigo tinyint identity,
		  nombre varchar(20),
		  profesor varchar(15),
		  primary key(codigo)
		 );
		Go
		 create table inscriptos(
		  documento char(8) not null, 
		  codigodeporte tinyint not null,
		  anio char(4),
		  matricula char(1),--'s'=paga, 'n'=impaga
		  primary key(documento,codigodeporte,anio)
		 );
		 Go

		 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
		 insert into socios values('23333333','Betina Bustos','Bulnes 222');
		 insert into socios values('24444444','Carlos Castro','Caseros 333');

		 insert into deportes values('basquet','Juan Juarez');
		 insert into deportes values('futbol','Pedro Perez');
		 insert into deportes values('natacion','Marina Morales');

		 insert into inscriptos values ('22222222',3,'2006','s');
		 insert into inscriptos values ('23333333',3,'2006','s');
		 insert into inscriptos values ('24444444',3,'2006','n');

		Go
		 select s.nombre,d.nombre,anio
		  from deportes as d
		  right join inscriptos as i
		  on codigodeporte=d.codigo
		  left join socios as s
		  on i.documento=s.documento;
		Go
		 select s.nombre,d.nombre,anio,matricula
		  from deportes as d
		  full join inscriptos as i
		  on codigodeporte=d.codigo
		  full join socios as s
		  on s.documento=i.documento;
		 Go
		 select s.nombre,d.nombre,anio,matricula
		  from deportes as d
		  join inscriptos as i
		  on codigodeporte=d.codigo
		  join socios as s
		  on s.documento=i.documento
		  where s.documento='22222222';

		  -- Problema 50. Union
		  if object_id('clientes') is not null
		  drop table clientes;
		Go
		 if object_id('proveedores') is not null
		  drop table proveedores;
		Go
		 if object_id('empleados') is not null
		  drop table empleados;
		Go
		 create table proveedores(
		  codigo int identity,
		  nombre varchar (30),
		  domicilio varchar(30),
		  primary key(codigo)
		 );
		 Go
		 create table clientes(
		  codigo int identity,
		  nombre varchar (30),
		  domicilio varchar(30),
		  primary key(codigo)
		 );
		Go
		 create table empleados(
		  documento char(8) not null,
		  nombre varchar(20),
		  apellido varchar(20),
		  domicilio varchar(30),
		  primary key(documento)
		 );
		 Go
		 insert into proveedores values('Bebida cola','Colon 123');
		 insert into proveedores values('Carnes Unica','Caseros 222');
		 insert into proveedores values('Lacteos Blanca','San Martin 987');
		 insert into clientes values('Supermercado Lopez','Avellaneda 34');
		 insert into clientes values('Almacen Anita','Colon 987');
		 insert into clientes values('Garcia Juan','Sucre 345');
		 insert into empleados values('23333333','Federico','Lopez','Colon 987');
		 insert into empleados values('28888888','Ana','Marquez','Sucre 333');
		 insert into empleados values('30111111','Luis','Perez','Caseros 956');
		Go
		 select nombre, domicilio from proveedores
		  union
		  select nombre, domicilio from clientes
		   union
		   select (apellido+' '+nombre), domicilio from empleados;
		Go
		 select nombre, domicilio, 'proveedor' as categoria from proveedores
		  union
		  select nombre, domicilio, 'cliente' from clientes
		   union
		   select (apellido+' '+nombre), domicilio , 'empleado' from empleados
		  order by categoria;

		  --- Problema  51. Agregar y eliminar campos ( alter table - add - drop)
		  if OBJECT_ID ('empleados') is not null
		  drop table empleados
		  Go
		 create table empleados(
			apellido varchar(20),
			nombre varchar(20),
			domicilio varchar(20),
			FechaIngreso date
		);
		Go
		insert into empleados(apellido,nombre) values('Cordero', 'Ramon');
		Go
		alter table empleados
		add sueldo decimal(5,2);
		Go
		select *from empleados
		Go

		alter table empleados
		add codigo int identity;
		Go

		alter table empleados
		add documento varchar(20) not null;
		Go

		alter table empleados
		add documento varchar(20) not null default '00000';
		Go

		select *from empleados
		Go

		alter table empleados
		drop column sueldo;
		Go
		exec sp_columns empleados;
		Go

		alter table empleados
		drop column documento;
		go

		alter table empleados
		drop column codigo,FechaIngreso;
		Go

		exec sp_columns empleados;
		go

		--- Problema 52 - Alterar campos (alter table - alter)
		if OBJECT_ID('empleados') is not null
		drop table empleados
		go
		create table empleados(
		  legajo int not null,
		  documento char(7) not null,
		  nombre varchar(10),
		  domicilio varchar(30),
		  ciudad varchar(20) default 'Santo Domingo',
		  sueldo decimal(6,2),
		  cantidadhijos tinyint default 0,
		  primary key(legajo)
		);

		Go
		alter table empleados
		alter column nombre varchar(30);
		Go
		exec sp_columns empleados;
		alter table empleados
		alter column sueldo decimal(6,2) not null;
		alter table empleados
		alter column documento varchar(8);
		alter table empleados
		alter column legajo tinyint not null;
		insert into empleados values(1,'22222222','Juan Cordero','Cristo Rey','Cordoba',500,3);
		insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);
		alter table empleados
		alter column nombre varchar(30) not null;
		delete from empleados where nombre is null;
		alter table empleados
		alter column ciudad varchar(10);
		insert into empleados values(3,'33333333','Juan Cordero','Sarmiento 856',default,500,4);
		alter table empleados
		alter column ciudad varchar(15);
		insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

		--- Problema 53. Campos calculados
		if object_id('articulos') is not null
		  drop table articulos;
		Go
		create table articulos(
		  codigo int identity,
		  descripcion varchar(30),
		  precio decimal(5,2) not null,
		  cantidad smallint not null default 0,
		  montototal as precio *cantidad
		);
		Go
		insert into articulos values('Jabones', 30, 2);
		insert into articulos values('Toallas', 50, 4);
		Go
		select *from articulos;
		Go

		update articulos set precio = 30 where descripcion = 'Toallas';
		select *from articulos;
		Go

		update articulos set cantidad = 6 where descripcion = 'Jabones';
		select *from articulos;
		Go

		update articulos set montototal = 50 where descripcion = 'Jabones';
		Go

		--- Problema 55.Subconsultas como expresión
		if object_id('alumnos') is not null
		 drop table alumnos;
		Go
		 create table alumnos(
		  documento char(8),
		  nombre varchar(30),
		  nota decimal(4,2),
		  primary key(documento),
		  constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
		 );
		Go
		 insert into alumnos values('30111111','Ana Algarbe',5.1);
		 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
		 insert into alumnos values('40225588', 'Pedro Camilo', 4.5);
		 Go

		 select nota from alumnos
		 where nota = (select max(nota) from alumnos);
		 Go

		 select nombre, nota from alumnos
		 where nota =(select max(nota) from alumnos)
		 Go

		select alumnos.*,
		 (select avg(nota) from alumnos)-nota as diferencia
		  from alumnos
		  where nota< (select avg(nota) from alumnos);
		Go
		update alumnos set nota = 4
		where nota = (select MIN(nota) from alumnos)
		Go

		delete from alumnos
		where nota < (select AVG(nota) from alumnos)
		Go

		--- Problema 56. Subconsultas con in
		  if (object_id('ciudades')) is not null
		   drop table ciudades;
		  if (object_id('clientes')) is not null
		   drop table clientes;
		Go
		 create table ciudades(
		  codigo tinyint identity,
		  nombre varchar(20),
		  primary key (codigo)
		 );
		Go
		 create table clientes (
		  codigo int identity,
		  nombre varchar(30),
		  domicilio varchar(30),
		  codigociudad tinyint not null,
		  primary key(codigo), constraint FK_clientes_ciudad
		  foreign key (codigociudad)
		  references ciudades(codigo)
		  on update cascade,
		 );

		 Go
		insert into ciudades (nombre) values('Cordoba');
		insert into ciudades (nombre) values('Cruz del Eje');
		insert into ciudades (nombre) values('Carlos Paz');
		Go
		insert into clientes values ('Lopez Marcos','Colon 111',1);
		insert into clientes values ('Lopez Hector','San Martin 222',1);
		insert into clientes values ('Perez Ana','San Martin 333',2);
		Go

		select nombre from ciudades
		where codigo in (select codigociudad from clientes where domicilio like '%San Martin%');
		Go
		 select distinct ci.nombre from ciudades as ci
		 join clientes as cl on codigociudad=ci.codigo where domicilio like 'San Martin%';
		 Go

		select nombre from ciudades
		where codigo not in (select codigociudad from clientes where domicilio like 'G%');
		Go
		 select codigociudad from clientes
		 where nombre like 'G%';
		 Go

		 --- Problema 57. Subconsultas any - some - all
		if object_id('inscriptos') is not null
		drop table inscriptos;
		if object_id('socios') is not null
		drop table socios;

		Go
		create table socios(
		  numero int identity,
		  documento char(8),
		  nombre varchar(30),
		  domicilio varchar(30),
		  primary key (numero)
		 );
		Go
		create table inscriptos (
		  numerosocio int not null,
		  deporte varchar(20) not null,
		  cuotas tinyint
		  constraint CK_inscriptos_cuotas
		  check (cuotas>=0 and cuotas<=10)
		  constraint DF_inscriptos_cuotas default 0,
		  primary key(numerosocio,deporte),
		  constraint FK_inscriptos_socio
		  foreign key (numerosocio)
		  references socios(numero)
		  on update cascade
		  on delete cascade,
		);
		Go

		insert into socios values('23333333','Alberto Paredes','Colon 111');
		insert into socios values('24444444','Carlos Conte','Sarmiento 755');
		insert into socios values('25555555','Fabian Fuentes','Caseros 987');
		Go
		insert into inscriptos values(1,'tenis',1);
		insert into inscriptos values(1,'basquet',2);
		insert into inscriptos values(1,'natacion',1);
		Go
		select numero,nombre,deporte from socios as s join inscriptos as i on numerosocio=numero;
		Go
		select nombre from socios join inscriptos as i on numero=numerosocio
		where deporte='natacion' and  numero= any (select numerosocio  from inscriptos as i  where deporte='tenis');
		Go
		select deporte from inscriptos 
		as i  where numerosocio=1 and deporte= any (select deporte from inscriptos as i where numerosocio=2);
		Go
		select i1.deporte from inscriptos as i1
		join inscriptos as i2
		on i1.deporte=i2.deporte
		where i1.numerosocio=1 and
		i2.numerosocio=2;
		Go
		select deporte from inscriptos as i
		where numerosocio=2 and cuotas>any (select cuotas from inscriptos where numerosocio=1);
		Go
		select deporte from inscriptos as i
		where numerosocio=2 and cuotas>all (select cuotas from inscriptos where numerosocio=1);
		Go
		delete from inscriptos 
		where numerosocio=any (select numerosocio from inscriptos where cuotas=0);
		Go

		--- Problema 58. Subconsultas correlacionadas
		select nombre, domicilio, (select COUNT(*) from inscriptos as i where s.numero = i.numerosocio)
		from socios as s;
		Go
		select nombre, (select (count(*)*10) from inscriptos as i
		where s.numero=i.numerosocio) as total, (select sum(i.cuotas) from inscriptos as i
		where s.numero=i.numerosocio) as pagas from socios as s;
		Go
		select nombre, count(i.deporte)*10 as total, sum(i.cuotas) as pagas from socios as s join inscriptos as i
		on numero=numerosocio group by nombre;
		Go

		--- Problema 59. Exists y No Exists
		select nombre from socios as s
		where exists(select *from inscriptos as i
		where s.numero = i.numerosocio and i.deporte = 'natacion');
		Go
		select nombre from socios as s
		where not exists(select *from inscriptos as i
		where s.numero = i.numerosocio and i.deporte = 'natacion');
		Go
		select s.* from socios as s
		where exists (select *from inscriptos as i
		where s.numero=i.numerosocio and i.cuotas=10);
		Go

		--- Problema 60.  Subconsulta en lugar de una tabla
		 if object_id('inscriptos') is not null
		  drop table inscriptos;
		 if object_id('socios') is not null
		  drop table socios;
		 if object_id('deportes') is not null
		  drop table deportes;
		Go
		create table socios(
		  documento char(8) not null, 
		  nombre varchar(30),
		  domicilio varchar(30),
		  primary key(documento)
		);
		Go

		create table deportes(
		  codigo tinyint identity,
		  nombre varchar(20),
		  profesor varchar(15),
		  primary key(codigo)
		);
		Go
		create table inscriptos(
		  documento char(8) not null, 
		  codigodeporte tinyint not null,
		  año char(4),
		  matricula char(1),--'s'=paga, 'n'=impaga
		  primary key(documento,codigodeporte,año),
		  constraint FK_inscriptos_socio
		   foreign key (documento)
		   references socios(documento)
		   on update cascade
		   on delete cascade
		);
		Go
		insert into socios values('22222222','Ana Acosta','Avellaneda 111');
		insert into socios values('23333333','Betina Bustos','Bulnes 222');
		 Go
		insert into deportes values('basquet','Juan Juarez');
		insert into deportes values('futbol','Pedro Perez');
		Go
		insert into inscriptos values ('22222222',3,'2006','s');
		insert into inscriptos values ('23333333',3,'2006','s');
		Go

		select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor from deportes as d 
		join inscriptos as i
		 on d.codigo=i.codigodeporte;
		Go

		select s.nombre,td.deporte,td.profesor,td.año,td.matricula from socios as s
		join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor from deportes as d
		join inscriptos as i on d.codigo=i.codigodeporte) as td on td.documento=s.documento;
		Go

		--- Problema  61. Subconsulta (update - delete)
		if object_id('inscriptos') is not null
		  drop table inscriptos;
		 if object_id('socios') is not null
		  drop table socios;
		Go
		create table socios(
		  numero int identity,
		  documento char(8),
		  nombre varchar(30),
		  domicilio varchar(30),
		  primary key (numero)
		 );
		Go
		create table inscriptos (
		  numerosocio int not null,
		  deporte varchar(20) not null,
		  matricula char(1),-- 'n' o 's'
		  primary key(numerosocio,deporte),
		  constraint FK_inscriptos_socio
		  foreign key (numerosocio)
		  references socios(numero)
		);
		Go
		insert into socios values('23333333','Alberto Paredes','Colon 111');
		insert into socios values('24444444','Carlos Conte','Sarmiento 755');
		insert into socios values('25555555','Fabian Fuentes','Caseros 987');

		insert into inscriptos values(1,'tenis','s');
		insert into inscriptos values(2,'basquet','s');
		insert into inscriptos values(3,'natacion','s');
		Go
		update inscriptos set matricula='s' where numerosocio= (select numero from socios
		where documento='25555555');
		Go
		delete from inscriptos where numerosocio in (select numero from socios as s join inscriptos
		on numerosocio=numero
		where matricula='n');
		GO

		--- Problema 62.  Subconsulta (insert)
		if object_id('facturas') is not null
		  drop table facturas;
		 if object_id('clientes') is not null
		  drop table clientes;
		Go
		 create table clientes(
		  codigo int identity,
		  nombre varchar(30),
		  domicilio varchar(30),
		  primary key(codigo)
		);
		Go
		 create table facturas(
		  numero int not null,
		  fecha datetime,
		  codigocliente int not null,
		  total decimal(6,2),
		  primary key(numero),
		  constraint FK_facturas_cliente
		   foreign key (codigocliente)
		   references clientes(codigo)
		   on update cascade
		);
		Go

		insert into clientes values('Juan Lopez','Colon 123');
		insert into clientes values('Luis Torres','Sucre 987');

		insert into facturas values(1200,'2007-01-15',1,300);
		insert into facturas values(1201,'2007-01-15',2,550);
		insert into facturas values(1202,'2007-01-15',3,150);
		Go

		if object_id ('clientespref') is not null
		drop table clientespref;
		create table clientespref(
		  nombre varchar(30),
		  domicilio varchar(30)
		);
		Go
		insert into clientespref select nombre,domicilio from clientes 
		where codigo in (select codigocliente from clientes as c
		join facturas as f on codigocliente=codigo
		group by codigocliente having sum(total)>500);
		Go
		select * from clientespref;
		Go

		--- Problema 66. Lenguaje de Control de flujo case
		if object_id('empleados') is not null
		  drop table empleados;
		Go
		 create table empleados(
		  documento char(8) not null,
		  nombre varchar(30) not null,
		  sexo char(1),
		  fechanacimiento datetime,
		  fechaingreso datetime,
		  cantidadhijos tinyint,
		  sueldo decimal(5,2),
		  primary key(documento)
		);
		Go

		insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
		insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
		insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
		insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700); 
		GO
		select sexo, count(*) as cantidad, obsequio= case  when sexo='f' then 'rosas'
		else 'corbata' end from empleados
		where datepart(month,fechanacimiento)=5 group by sexo;
		Go
		--- Problema 67. Lenguaje de control de flujo (if)
		if exists(select * from empleados
		where datepart(month,fechanacimiento)=5)--si hay empleados que cumplan en mayo
		(select sexo,count(*) as cantidad  from empleados
		where datepart(month,fechanacimiento)=5
		group by sexo)
		else select 'no hay empleados que cumplan en mayo';
		Go

		--- Problema 75- funciones de tabla de varias instrucciones
		Drop table empleados;
		Create table empleados(
		Documento char(8) not null,
		Apellido varchar(30) not null,
		Nombre varchar(30) not null,
		Domicilio varchar(30),
		Ciudad varchar(30),
		Fechanacimiento datetime,
		Constraint pk_empleados
		Primary key(documento)
		);

		Insert into empleados values('22222222','acosta','ana','avellaneda 123','cordoba','1970/10/10');
		Insert into empleados values('23333333','bustos','bernardo','bulnes 234','cordoba','1972/05/15');
		Insert into empleados values('24444444','caseros','carlos','colon 356','carlos paz','1980/02/25');
		Insert into empleados values('25555555','fuentes','fabiola','fragueiro 987','jesus maria','1984/06/12');

		If object_id('f_empleados') is not null
		Drop function f_empleados;
		Create function f_empleados

		(@opcion varchar(10)
		)
		Returns @listado table
		(documento char(8),
		Nombre varchar(60),
		Domicilio varchar(60),
		Nacimiento varchar(12))
		As 
		Begin
		If @opcion not in ('total','parcial')
		Set @opcion='parcial'
		If @opcion='total'
		Insert @listado 
		Select documento,
		(apellido+' '+nombre),
		(domicilio+' ('+ciudad+')'), 
		Cast(fechanacimiento as varchar(12))
		From empleados
		Else
		Insert @listado
		Select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
		From empleados
		Return
		End;
		Select *from dbo.f_empleados('total');
		Select *from dbo.f_empleados();
		Select *from dbo.f_empleados('');
		Select *from dbo.f_empleados('parcial')
		Where domicilio='cordoba';

		--- Problema 76- funciones con valores de tabla en línea

		If object_id('libross') is not null

		Drop table libross;
		Create table libross(
		Codigo int identity,
		Titulo varchar(40),
		Autor varchar(30),
		Editorial varchar(20)
		);
		Insert into libros values('uno','richard bach','planeta');
		Insert into libros values('el aleph','borges','emece');
		Insert into libros values('ilusiones','richard bach','planeta');
		Insert into libros values('aprenda php','mario molina','nuevo siglo');
		Insert into libros values('matematica estas ahi','paenza','nuevo siglo');

		If object_id('f_libros') is not null

		Drop function f_libros;

		Create function f_libros
		(@autor varchar(30)='borges')
		Returns table
		As
		Return (
		Select titulo,editorial
		From libros
		Where autor like '%'+@autor+'%'
		);

		Select *from f_libros('bach');

		If object_id('f_libros_autoreditorial') is not null

		Drop function f_libros_autoreditorial;

		Create function f_libros_autoreditorial

		(@autor varchar(30)='borges',

		@editorial varchar(20)='emece')

		Returns table
		As

		Return (
		Select titulo,autor,editorial

		From libros
		Where autor like '%'+@autor+'%' and Editorial like '%'+@editorial+'%'

		);

		Select *from f_libros_autoreditorial('','nuevo siglo');

		Select *from f_libros_autoreditorial(default,default);		
		
														

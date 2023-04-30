create table estudiante (
 codigo varchar(11) not null,
 nombres varchar(40) not null,
 apellidos varchar(40) not null,
 correo_personal varchar(40) not null,
 tipo_documento varchar(20) not null,
 fecha_nacimiento DATE not null,
 num_documento number(10) not null,
 celular varchar(14) not null,
 proyecto_curricular varchar(30) not null,
 correo_institucional varchar(40) not null
);

insert into estudiante values('20182020108', 'Edwin Alejandro', 'Fiesco Parra', 'correorandom@hotmail.com'
, 'CC', '17/03/2000', 123456789, '+57 3192680544', 'Ing. Sistemas', 'correorandom2@udistrital.edu.co');

commit;
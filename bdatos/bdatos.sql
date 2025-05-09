create database if not exists Tienda_Mundo;
use Tienda_Mundo;

create table if not exists t_usuarios(
    id_usuario int(11) auto_increment not null,
    nombre      varchar(100)          not null,
    apellidos   varchar(100)          not null,
    email       varchar(200)          not null,
    password    varchar(200)          not null,
    rol         varchar(20)           not null,
    imagen      varchar(255),
    constraint pk_usuario       primary key(id_usuario)
    constraint uq_email          unique (email)
)ENGINE=InnoDB;

insert into t_usuarios values('Admin','Admin','Admin@gmail.com','Admin','admin','Imagen');



create table if not exists t_pedidos(
	id_pedido		int 	AUTO_INCREMENT	not null primary key,
    ciudad			varchar(100)			not null,
    direccion		varchar(200)			not null,
    costo			float (100,2)			not null,
    estado			varchar(20)				not null,
    fecha			date,
    hora			time,
    t_id_usuario  int(11),
    foreign key (t_id_usuario)	references t_usuario(id_usuario)  
);

create table if not exists t_categoria(
	id_categoria	int(11)	auto_increment primary key	not null,
    nombre			varchar(100)		not null
);

create table if not exists t_productos(
	id_producto		int(11)primary key  auto_increment	not null,
    nombre			varchar(100)		not null,
    precio			float(100,2)		not null,
    stock			int(100)			not null,
    oferta			varchar(20),
    fecha			date,
    imagen			varchar(200),
    t_id_categoria	int,
    foreign key (t_id_categoria) references t_categoria(id_categoria)
);

create table if not exists t_lineapedidos(
	id_lineapedido		int(11)	auto_increment	primary key,
    unidades			int(10)			not null,
    t_id_pedido			int,
    t_id_producto		int,
    foreign key (t_id_pedido)	references t_pedidos(id_pedido),
    foreign key	(t_id_producto) references t_productos(id_producto)
);
drop table if exists usuarios cascade;

create table usuarios (
    id       bigserial   constraint pk_usuarios primary key,
    nombre   varchar(15) not null constraint uq_usuarios_nombre unique,
    password varchar(60) not null
);

drop table if exists historias cascade;

create table historias(
	id 		  bigserial constraint pk_historias primary key,
	titulo  	  varchar(100)  not null,
	texto_historia    text          not null,
	fecha_publicacion timestamptz   not null default current_timestamp,
	votos_positivos   int           not null default 0,
	votos_negativos   int           not null default 0 
);

drop table if exists comentarios cascade;

create table comentarios(
  	id                bigserial     constraint pk_comentarios primary key,
  	texto_comentario  varchar(500)  not null,
  	historias_id      bigint     	constraint fk_historias_id
                                    	references historias(id)
                                    	on delete no action
                                    	on update cascade,
  	usuarios_id       bigint        constraint fk_usuarios_id
                                    	references usuarios(id)
                                    	on delete no action
                                    	on update cascade,
  	fecha             timestamptz   not null default current_timestamp,
	votos	          int           not null default 0
);



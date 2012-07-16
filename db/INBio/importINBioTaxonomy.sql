copy taxa (id, name, rank, parent_id, ancestry)
from '/tmp/TAXA.csv'
with csv delimiter as ',' quote as '"';

update taxa
set source_id = 4
, updated_at = current_timestamp
, created_at = current_timestamp
, name = trim(name)
, name_provider = 'INBio'
, ancestry = '1/'||trim(ancestry);

update taxa
set rank = 'kingdom', rank_level = 70
where trim(rank) = 'Reino'; 

update taxa
set rank = 'phylum', rank_level = 60
where trim(rank) = 'Filo/Division'; 

update taxa
set rank = 'subphylum', rank_level = 57 
where trim(rank) = 'Subfilo/Subdivision'; 

update taxa
set rank = 'class', rank_level = 50
where trim(rank) = 'Clase'; 

update taxa
set rank = 'subclass', rank_level = 47 
where trim(rank) = 'Subclase'; 

update taxa
set rank = 'order', rank_level = 40
where trim(rank) = 'Orden'; 

update taxa
set rank = 'suborder', rank_level = 37 
where trim(rank) = 'Suborden';
 

update taxa
set rank = 'superfamily', rank_level = 33 
where trim(rank) = 'Superfamilia'; 

update taxa
set rank = 'family', rank_level = 30
where trim(rank) = 'Familia';
 
update taxa
set rank = 'subfamily', rank_level = 27 
where trim(rank) = 'Subfamilia'; 

update taxa
set rank = 'tribe', rank_level = 25
where trim(rank) = 'Tribu';

update taxa
set rank = 'subtribe', rank_level = 24
where trim(rank) = 'Subtribu'; 

update taxa
set rank = 'genus', rank_level = 20
where trim(rank) = 'Genero'; 

update taxa
set rank = 'subgenus'
where trim(rank) = 'Subgenero'; 

update taxa
set rank = 'section'
where trim(rank) = 'Seccion';
update taxa
set rank = 'subsection'
where trim(rank) = 'Subseccion'; 

update taxa
set rank = 'species', rank_level = 10
where trim(rank) = 'Especie'; 

update taxa
set rank = 'subspecies', rank_level = 5 
where trim(rank) = 'Subespecie'; 

update taxa
set rank = 'variety', rank_level = 5
where trim(rank) = 'Variedad';

update taxa
set rank = 'race'
where trim(rank) = 'Estirpe'; 

update taxa
set rank = 'form', rank_level = 5
where trim(rank) = 'Forma'; 

insert into taxon_names (name, is_valid, lexicon, source_identifier, taxon_id, source_id, name_provider, created_at, updated_at)
select name, TRUE, 'Scientific Names', source_identifier, id, 4, 'ColNameProvider', created_at, updated_at
from taxa;


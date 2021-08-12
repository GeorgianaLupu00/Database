use inchiriere_costume;

-- JOIN CU 4 TABELE, FOLOSIND WHERE ( SELECTEAZA ID-UL COSTUMULUI SI ID-UL FABRICII CARE FACE COSTUME DIN IN CLUJ DE CALITATE 5

SELECT ID_COSTUM, ID_FABRICA, DENUMIRE, ORAS
FROM COSTUM JOIN FABRICA ON (ID_COSTUM = ID_FABRICA) JOIN 
MATERIAL USING (ID_FABRICA) JOIN ADRESA USING (ID_FABRICA)
WHERE DENUMIRE ="IN" OR ORAS = "CLUJ" GROUP BY ID_COSTUM HAVING
CALITATE = 5;

-- filtrare pe linii

SELECT ID_MATERIAL, DENUMIRE FROM MATERIAL WHERE LUNGIME >30;

-- funcțiilor NVL și DECODE, a cel puțin unei expresii CASE + siruri de caractere

select concat_ws(' ',nume,left(prenume,1),'.') as "nume intreg", 
	   concat_ws(' ',username,left(parola,1),'.') as "logare angajat",
       case 
        when  concat_ws(' ',username,left(parola,1),'.') = concat_ws(' ',nume,left(prenume,1),'.') then 'nu e angajat aici, e intrus'
        else 'este angajat' end as 'verificare'
from angajat;

-- group by, where, 
-- utilizarea a cel puțin 1 bloc de cerere (clauza WITH)

with client as (select * 
from client join inchiriere using(id_client) 
where id_client = 21)
Select nume, prenume
from client
group by prenume;

-- 12. Implementarea a 3 operații de actualizare sau suprimare a datelor utilizând subcereri.

-- 1) Adaugare coloana noua in angajati: "salariu". 
-- Intorce 'da' daca angajatul are salariu, respectiv 'nu' daca acesta 
-- este stagiar si nu are inca salariu

ALTER TABLE `inchiriere_costume`.`angajat` 
ADD COLUMN `SALARIU` INT NULL AFTER `PAROLA`;
 
CREATE TABLE angajat_aux AS SELECT * FROM angajat;
update angajat
set salariu = (select case
                  when salariu > 100 then 'da'
                  else 'nu' end);
rollback;

select * from angajat; 
 
ALTER TABLE `inchiriere_costume`.`angajat` 
drop column `salariu`;

DROP TABLE `angajat_aux`;

-- 2) Angajatii primesc de la magazin un username si o parola de utilizator
-- adaug in tabelul angajati o coloana noua "username_institutional" care contine username-ul valid la magazin
-- felul urmator numePrenume_costumerie

ALTER TABLE `inchiriere_costume`.`angajat` 
add COLUMN `username_institutional` VARCHAR(100) NULL ;

CREATE TABLE angajat_aux AS SELECT * FROM angajat;
update angajat
set username_institutional = (select CONCAT(nume, prenume, 'costumerie') AS username_institutional);
rollback;
select * from angajat; 

DROP TABLE `angajat_aux`;

-- 13.  Pentru tabelul Plata: autoincrement la id_Plata, daca adaug o adresa noua fara id acesta merge deoarece este auto increment

CREATE TABLE `inchiriere_costume`.`plata` (
  `ID_PLATA` INT NOT NULL AUTO_INCREMENT,
  `ID_CLIENT` INT NOT NULL,
  `ID_ANGAJAT` INT NOT NULL,
  `DATA_PLATA` DATE DEFAULT NULL,
  `SUMA` INT NULL,
  PRIMARY KEY (`ID_PLATA`));

-- 15. 
-- Crearea unui index care să optimizeze o cerere de tip căutare cu 2 criterii. Specificați cererea.
-- - indexul format din nume si prenume 

create index nume_intreg

on angajat (nume,prenume);
show index from angajat;
 
select * from angajat
where nume='Top';
 
explain select * from angajat
where nume='Micu';
 
select *
from angajat
where nume = 'Top' and prenume = 'Adi';
 
explain select *
from angajat
where nume = 'Top' and prenume = 'Adi';
 
-- Identic si pe tabela Client unde exista aceeasi pereche nume/prenume

-- 16.
 
-- outer join: Afisati toate datele despre fabrici, angajati si magazinele de unde poti inchiria si adresele lor

 select * from adresa left outer join angajat on (id_angajat = id_adresa) left outer join fabrica using (id_adresa)
left join magazin using (id_adresa);

select id_costum, id_material from croitorie where count(id_material) > 2 group by id_costum;

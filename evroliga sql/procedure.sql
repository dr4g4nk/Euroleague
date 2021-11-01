DELIMITER ;;
CREATE PROCEDURE `deletePLayer`(
	in id int, 
    in klub int,
    in sezona int
    )
BEGIN
delete from igrau where IdOsobe=id and IdKluba=klub and IdSezone=sezona;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE  PROCEDURE `getPlayerStatistics`(
	in igrac int,
    in sezona int
)
BEGIN
select i.* from igracnautakmici i inner join utakmica u on i.IdUtakmice=u.IdUtakmice where i.IdOsobe=igrac and u.IdSezone=sezona;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE  PROCEDURE `insertClub`(
	in naziv varchar(45),
    in predsjednik int,
    in adresa int, 
    in info Text,
    in grb varchar(100),
    in telefon varchar(45),
    in stranica varchar(150),
    in twitter varchar(150),
    in instagram varchar(150),
    in facebook varchar(150),
    in youtube varchar(150),
    out result varchar(100),
    out lastId int
    )
BEGIN
declare id int default 0;

select IdKluba into id from klub k where k.Naziv=naziv;
set lastId=0;
if id=0 then
	insert into klub (Naziv, IdPredsjednika, Info, IdAdrese, Grb, Telefon, ZvanicnaStranica, Twitter, Instagram, Facebook, YouTube) values (naziv, predsjednik, info, adresa, grb, telefon, stranica, twitter, instagram, facebook, youtube);
	set lastId=last_insert_id();
else set result='Klub vec postoji';

end if;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE `insertGame`(
	in vrijeme datetime,
    in pcd int,
    in pcg int,
    in dcd int,
    in dcg int,
    in tcd int,
    in tcg int,
    in ccd int,
    in ccg int,
    in pd int,
    in pg int,
    in domacin int,
    in gost int,
    in kolo int,
    in faza varchar(45),
    in sezona int,
    in idSudije1 int,
    in idSudije2 int,
    in idSudije3 int,
    out msg varchar(100),
    out id int
)
BEGIN
declare u int default 0;
declare p int default 0;

select IdUtakmice into u from utakmica where IdDomacina=domacin and IdGosta=gost and IdKola=kolo;
select IdUtakmice into p from utakmica where (IdDomacina=domacin or IdGosta=gost or IdDomacina=gost or IdGosta=domacin) and IdKola=kolo;
set id=0;
if u=0 and p=0 then
	insert into utakmica (Vrijeme, PrvaCetvrtinaD, PrvaCetvrtinaG, DrugaCetvrtinaD, DrugaCetvrtinaG, TrecaCetvrtinaD, TrecaCetvrtinaG, CetvrtaCetvrtinaD, CetvrtaCetvrtinaG, ProduzeciD, ProduzeciG, IdDomacina, IdGosta, IdKola, Faza, IdSezone)
    values (vrijeme, pcd, pcg, dcd, dcg, tcd, tcg, ccd, ccg, pd, pg, domacin, gost, kolo, faza, sezona);
	
	set id=last_insert_id();
    
    insert into sudijanautakmici (IdUtakmice, IdOsobe) values (id, idSudije1);
    insert into sudijanautakmici (IdUtakmice, IdOsobe) values (id, idSudije2);
    insert into sudijanautakmici (IdUtakmice, IdOsobe) values (id, idSudije3);
elseif u!=0 then
	set msg='Utakmica sa ovim domacinom, gostom i kolom vec postoji';
else set msg='Jedan ili oba tima su vec igrali u ovom kolu';
end if;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `insertPlayer`(
	in ime varchar(45),
    in prezime varchar(45),
    in datumRodjenja date,
    in visina decimal(4,2),
    in pozicija varchar(45),
    in slika varchar(100),
    in drzava int,
    in biografija text,
    out lastId int
    )
BEGIN
declare p int default 0;
declare id int;
select i.IdOsobe into p from igrac i inner join osoba o on i.IdOsobe=o.IdOsobe where o.Ime=ime and o.Prezime=prezime and o.DatumRodjenja=datumRodjenja;
if p=0 then
	insert into osoba (Ime, Prezime, DatumRodjenja, Slika, IdDrzave) values (ime, prezime, datumRodjenja, slika, drzava);
    set lastId = last_insert_id();
    insert into igrac (IdOsobe, Pozicija, Visina, Biografija) values(lastId, pozicija, visina, biografija);
end if;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `insertPlayerStatistic`(
	in osoba int, 
    in utakmica int, 
    in pts int,
    in `min` varchar(15), 
    in fgm int, 
    in fga int,
    in _3fgm int,
    in _3fga int, 
    in ftm int,
    in fta int,
    in `as` int,
    in oreb int,
    in dreb int,
    in blk int,
	in stl int, 
    in fouls int,
    out msg varchar(100)
)
BEGIN
declare id int default 0; 
select IdOsobe into id from igracnautakmici where IdOsobe=osoba and IdUtakmice=utakmica;
if id=0 then
	insert into igracnautakmici (`IdOsobe`, `IdUtakmice`, `PTS`, `MIN`, `2FGM`, `2FGA`, `3FGM`, `3FGA`, FTM, FTA, `AS`, OReb, DReb, BLK, STL, Fouls) values (osoba, utakmica, pts, `min`, fgm, fga, _3fgm, _3fga, ftm, fta, `as`, oreb, dreb, blk, stl, fouls);
else set msg='Statistika za ovaj mec vec postoji';
end if;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `insertPresident`(
	in ime varchar(45),
    in prezime varchar(45),
    in datumRodjenja date,
    in slika varchar(100),
    in drzava int
)
BEGIN
declare id int default 0;

insert into osoba (Ime, Prezime, DatumRodjenja, Slika, IdDrzave) values (ime, prezime, datumRodjenja, slika, drzava);
set id = last_insert_id();
insert into predsjednik (IdOsobe) values(id);
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `insertReferee`(
	in ime varchar(45),
    in prezime varchar(45),
    in datumRodjenja date,
    in slika varchar(100),
    in drzava int
)
BEGIN
declare id int default 0;

insert into osoba (Ime, Prezime, DatumRodjenja, Slika, IdDrzave) values (ime, prezime, datumRodjenja, slika, drzava);
set id = last_insert_id();
insert into sudija (IdOsobe) values(id);
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `updateClub`(
	in pId int,
	in pNaziv varchar(45),
    in pPredsjednik int,
    in pAdresa int, 
    in pInfo Text,
    in pGrb varchar(100),
    in pTelefon varchar(45),
    in pStranica varchar(150),
    in pTwitter varchar(150),
    in pInstagram varchar(150),
    in pFacebook varchar(150),
    in pYouTube varchar(150),
    out result varchar(50)
    )
BEGIN
declare id int default 0;
select IdKluba into id from klub where Naziv=pNaziv;
    if id=pId or id=0 then
		update klub set Naziv=pNaziv, IdPredsjednika=pPredsjednik, IdAdrese=pAdresa, Info=pInfo, 
			Grb=pGrb, Telefon=pTelefon, ZvanicnaStranica=pStranica, Twitter=pTwitter, Instagram=pInstagram,
			Facebook=pFacebook, YouTube=pYouTube where klub.IdKluba=pId;
	else set result='Klub vec postoji';
	end if;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `updatePlayer`(
		in id int, 
		in ime varchar(45),
        in prezime varchar(45),
        in drzava int,
        in datumRodjenja date, 
        in pozicija varchar(45),
        in visina decimal(4,2),
        in slika varchar(100),
        in biografija text
)
BEGIN
	update osoba set Ime=ime, Prezime=prezime, IdDrzave=drzava, DatumRodjenja=datumRodjenja, Slika=slika where IdOsobe=id;
	update Igrac set Visina=visina, Pozicija=pozicija, Biografija=biografija where IdOsobe=id;
END ;;
DELIMITER ;



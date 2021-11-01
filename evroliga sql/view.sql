CREATE VIEW `address` AS
    SELECT 
        `a`.`IdAdrese` AS `IdAdrese`,
        `a`.`Ulica` AS `Ulica`,
        `a`.`Broj` AS `Broj`,
        `g`.`IdGrada` AS `IdGrada`,
        `g`.`Naziv` AS `Grad`,
        `d`.`IdDrzave` AS `IdDrzave`,
        `d`.`Naziv` AS `Drzava`
    FROM
        ((`adresa` `a`
        JOIN `grad` `g` ON ((`a`.`IdGrada` = `g`.`IdGrada`)))
        JOIN `drzava` `d` ON ((`g`.`IdDrzave` = `d`.`IdDrzave`)));


CREATE VIEW `club` AS
    SELECT 
        `k`.`IdKluba` AS `IdKluba`,
        `k`.`Naziv` AS `Naziv`,
        `k`.`Info` AS `Info`,
        `k`.`Grb` AS `Grb`,
        `k`.`Telefon` AS `Telefon`,
        `k`.`ZvanicnaStranica` AS `ZvanicnaStranica`,
        `k`.`Twitter` AS `Twitter`,
        `k`.`Instagram` AS `Instagram`,
        `k`.`Facebook` AS `Facebook`,
        `k`.`YouTube` AS `YouTube`,
        `a`.`IdAdrese` AS `IdAdrese`,
        `a`.`Ulica` AS `Ulica`,
        `a`.`Broj` AS `Broj`,
        `g`.`IdGrada` AS `IdGrada`,
        `g`.`Naziv` AS `Grad`,
        `d`.`IdDrzave` AS `IdDrzave`,
        `d`.`Naziv` AS `Drzava`,
        `o`.`IdOsobe` AS `IdOsobe`,
        `o`.`Ime` AS `Ime`,
        `o`.`Prezime` AS `Prezime`,
        `klubsezona`.`IdSezone` AS `IdSezone`,
        `klubsezona`.`W` AS `W`,
        `klubsezona`.`L` AS `L`,
        `klubsezona`.`PTS+` AS `PTS+`,
        `klubsezona`.`PTS-` AS `PTS-`
    FROM
        (((((`klub` `k`
        JOIN `adresa` `a` ON ((`k`.`IdAdrese` = `a`.`IdAdrese`)))
        JOIN `grad` `g` ON ((`a`.`IdGrada` = `g`.`IdGrada`)))
        JOIN `drzava` `d` ON ((`g`.`IdDrzave` = `d`.`IdDrzave`)))
        JOIN `osoba` `o` ON ((`o`.`IdOsobe` = `k`.`IdPredsjednika`)))
        JOIN `klubsezona` ON ((`k`.`IdKluba` = `klubsezona`.`IdKluba`)));


CREATE VIEW `player` AS
    SELECT 
        `o`.`IdOsobe` AS `IdOsobe`,
        `o`.`Ime` AS `Ime`,
        `o`.`Prezime` AS `Prezime`,
        `o`.`DatumRodjenja` AS `DatumRodjenja`,
        `o`.`Slika` AS `Slika`,
        `o`.`IdDrzave` AS `IdDrzave`,
        `d`.`Naziv` AS `Naziv`,
        `i`.`Visina` AS `Visina`,
        `i`.`Pozicija` AS `Pozicija`,
        `i`.`Biografija` AS `Biografija`,
        `u`.`Dres` AS `Dres`,
        `u`.`IdSezone` AS `IdSezone`,
        `u`.`IdKluba` AS `IdKluba`
    FROM
        (((`igrac` `i`
        JOIN `osoba` `o` ON ((`i`.`IdOsobe` = `o`.`IdOsobe`)))
        JOIN `drzava` `d` ON ((`o`.`IdDrzave` = `d`.`IdDrzave`)))
        JOIN `igrau` `u` ON ((`i`.`IdOsobe` = `u`.`IdOsobe`)));



CREATE VIEW `playersongame` AS
    SELECT 
        `iu`.`IdOsobe` AS `IdOsobe`,
        `iu`.`IdUtakmice` AS `IdUtakmice`,
        `iu`.`PTS` AS `PTS`,
        `iu`.`MIN` AS `MIN`,
        `iu`.`2FGM` AS `2FGM`,
        `iu`.`2FGA` AS `2FGA`,
        `iu`.`3FGM` AS `3FGM`,
        `iu`.`3FGA` AS `3FGA`,
        `iu`.`FTM` AS `FTM`,
        `iu`.`FTA` AS `FTA`,
        `iu`.`AS` AS `AS`,
        `iu`.`OReb` AS `OReb`,
        `iu`.`DReb` AS `DReb`,
        `iu`.`BLK` AS `BLK`,
        `iu`.`STL` AS `STL`,
        `iu`.`Fouls` AS `Fouls`,
        `o`.`Ime` AS `Ime`,
        `o`.`Prezime` AS `Prezime`,
        `k`.`Dres` AS `Dres`,
        `k`.`IdKluba` AS `IdKluba`,
        `k`.`IdSezone` AS `IdSezone`
    FROM
        (((`igracnautakmici` `iu`
        JOIN `osoba` `o` ON ((`o`.`IdOsobe` = `iu`.`IdOsobe`)))
        JOIN `utakmica` `u` ON ((`iu`.`IdUtakmice` = `u`.`IdUtakmice`)))
        JOIN `igrau` `k` ON (((`k`.`IdOsobe` = `iu`.`IdOsobe`)
            AND (`u`.`IdSezone` = `k`.`IdSezone`))));



CREATE VIEW `referee` AS
    SELECT 
        `sudijanautakmici`.`IdOsobe` AS `IdOsobe`,
        `sudijanautakmici`.`IdUtakmice` AS `IdUtakmice`,
        `osoba`.`Ime` AS `Ime`,
        `osoba`.`Prezime` AS `Prezime`,
        `osoba`.`DatumRodjenja` AS `DatumRodjenja`,
        `osoba`.`Slika` AS `Slika`,
        `osoba`.`IdDrzave` AS `IdDrzave`
    FROM
        (`sudijanautakmici`
        JOIN `osoba` ON ((`sudijanautakmici`.`IdOsobe` = `osoba`.`IdOsobe`)));



CREATE VIEW `clubaddress` AS
    SELECT 
        `klub`.`IdKluba` AS `IdKluba`,
        `klub`.`Naziv` AS `Naziv`,
        `klub`.`IdPredsjednika` AS `IdPredsjednika`,
        `osoba`.`Ime` AS `Ime Predsjednika`,
        `osoba`.`Prezime` AS `Prezime Predsjednika`,
        `klub`.`Info` AS `Info`,
        `klub`.`Grb` AS `Grb`,
        `klub`.`Telefon` AS `Telefon`,
        `klub`.`ZvanicnaStranica` AS `ZvanicnaStranica`,
        `klub`.`Twitter` AS `Twitter`,
        `klub`.`Instagram` AS `Instagram`,
        `klub`.`Facebook` AS `Facebook`,
        `klub`.`YouTube` AS `YouTube`,
        `klub`.`IdAdrese` AS `IdAdrese`,
        `adresa`.`Ulica` AS `Ulica`,
        `adresa`.`Broj` AS `Broj`,
        `adresa`.`IdGrada` AS `IdGrada`,
        `grad`.`Naziv` AS `Grad`,
        `grad`.`IdDrzave` AS `IdDrzave`,
        `drzava`.`Naziv` AS `Drzava`
    FROM
        ((((`klub`
        JOIN `osoba` ON ((`klub`.`IdPredsjednika` = `osoba`.`IdOsobe`)))
        JOIN `adresa` ON ((`klub`.`IdAdrese` = `adresa`.`IdAdrese`)))
        JOIN `grad` ON ((`adresa`.`IdGrada` = `grad`.`IdGrada`)))
        JOIN `drzava` ON ((`grad`.`IdDrzave` = `drzava`.`IdDrzave`)));

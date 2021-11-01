DELIMITER ;;
CREATE TRIGGER `utakmica_BEFORE_DELETE` BEFORE DELETE ON `utakmica` FOR EACH ROW BEGIN
declare ptsHome int default 0;
declare ptsGuest int default 0;

delete from sudijanautakmici where IdUtakmice=old.IdUtakmice; 
delete from igracnautakmici where IdUtakmice=old.IdUtakmice;

set ptsHome=old.PrvaCetvrtinaD+old.DrugaCetvrtinaD+old.TrecaCetvrtinaD+old.CetvrtaCetvrtinaD+old.ProduzeciD;
set ptsGuest=old.PrvaCetvrtinaG+old.DrugaCetvrtinaG+old.TrecaCetvrtinaG+old.CetvrtaCetvrtinaG+old.ProduzeciG;

update klubsezona set `PTS+`=`PTS+`-ptsHome, `PTS-`=`PTS-`-ptsGuest where IdKluba=old.IdDomacina and IdSezone=old.IdSezone;
update klubsezona set `PTS+`=`PTS+`-ptsGuest, `PTS-`=`PTS-`-ptsHome where IdKluba=old.IdGosta and IdSezone=old.IdSezone;
if ptsHome>ptsGuest then
	update klubsezona set `W`=`W`-1 where IdKluba=old.IdDomacina and IdSezone=old.IdSezone;
    update klubsezona set `L`=`L`-1 where IdKluba=old.IdGosta and IdSezone=old.IdSezone;
else
	update klubsezona set `W`=`W`-1 where IdKluba=old.IdGosta and IdSezone=old.IdSezone;
    update klubsezona set `L`=`L`-1 where IdKluba=old.IdDomacina and IdSezone=old.IdSezone;
end if;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE TRIGGER `utakmica_AFTER_INSERT` AFTER INSERT ON `utakmica` FOR EACH ROW BEGIN
declare domacinPTS int default 0;
declare gostPTS int default 0;

set domacinPTS=new.PrvaCetvrtinaD + new.DrugaCetvrtinaD + new.TrecaCetvrtinaD + new.CetvrtaCetvrtinaD + new.ProduzeciD;
set gostPTS=new.PrvaCetvrtinaG + new.DrugaCetvrtinaG + new.TrecaCetvrtinaG + new.CetvrtaCetvrtinaG + new.ProduzeciG;

update klubsezona set `PTS+`=`PTS+`+domacinPTS, `PTS-`=`PTS-`+gostPTS where IdKluba=new.IdDomacina and IdSezone=new.IdSezone;
update klubsezona set `PTS+`=`PTS+`+gostPTS, `PTS-`=`PTS-`+domacinPTS where IdKluba=new.IdGosta and IdSezone=new.IdSezone;

if domacinPTS>gostPTS then 
	update klubsezona set W=W+1 where IdKluba=new.IdDomacina and IdSezone=new.IdSezone;
	update klubsezona set L=L+1 where IdKluba=new.IdGosta and IdSezone=new.IdSezone;
else
	update klubsezona set W=W+1 where IdKluba=new.IdGosta and IdSezone=new.IdSezone;
	update klubsezona set L=L+1 where IdKluba=new.IdDomacina and IdSezone=new.IdSezone;
end if;
END ;;
DELIMITER ;
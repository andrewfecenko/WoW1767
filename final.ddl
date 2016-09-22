create table finalscore (name varchar(50), score decimal(10, 2), outcome varchar(40));
declare finalpred cursor for select player, score, outcome from (predicted left join tones on predicted.player=tones.name);
load from finalpred of cursor messages 'logs/finalpred.dat.log' insert into finalscore nonrecoverable;
update finalscore set outcome='neutral' where outcome is null;

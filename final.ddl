-- Create a table to store the final results
create table finalscore (name varchar(50), score decimal(10, 2), outcome varchar(40));
-- Create a cursor with the tier and tones associated for each player to be inserted into our new table.
declare finalpred cursor for select player, score, outcome from (predicted left join tones on predicted.player=tones.name);
-- Load the data from our cursor into the final table.
load from finalpred of cursor messages 'logs/finalpred.dat.log' insert into finalscore nonrecoverable;
-- Set the outcome to neutral for players with no outcome.
update finalscore set outcome='neutral' where outcome is null;

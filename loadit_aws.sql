-- Connect to our database
connect to wow ;

-- Load the Reddit Data from S3 into our comments table using our alias.
load from DB2REMOTE://S3ObjectStore//redditcomments.csv of del insert into comments ;

--Confirm that the load was successful by counting the rows.
select count(*) from comments ;

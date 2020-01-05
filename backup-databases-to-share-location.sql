use master;
set nocount on
declare @backup_all_databases varchar(max)
set @backup_all_databases = ''
select @backup_all_databases = @backup_all_databases +
'backup database [' + name + '] to disk = ''\\MyShareName\' + replace(name, '', '''') + '.bak'' with format;' + char(10)
from sys.databases where name not in ('tempdb') 
order by name asc
exec (@backup_all_databases)

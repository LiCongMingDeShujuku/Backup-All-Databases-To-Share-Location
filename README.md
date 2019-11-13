![CLEVER DATA GIT REPO](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/0-clever-data-github.png "李聪明的数据库")

# 备份所有数据库以共享位置
#### Backup All Databases To Share Location
**发布-日期: 2014年04月15日 (评论)**

## Contents

- [中文](#中文)
- [English](#English)
- [SQL Logic](#Logic)
- [Build Info](#Build-Info)
- [Author](#Author)
- [License](#License) 


## 中文
这是一个可以将所有数据库备份到网络上来共享位置的快速脚本。数据库备份文件的标题如下：MyDatabaseName.bak。另外还有些逻辑可以替换数据库名称中的撇号。我不知道为什么会有它们，但我发现了一个盒子，所以我把它包含在那里。另外，这不会备份系统数据库，仅备份用户数据库。


## English
Here’s a quick script that will backup all databases to a shared location on the network. The database backup files will be titled like this: MyDatabaseName.bak There is some extra logic to replace apostrophe’s in the database name in case you have any. I don’t know why you would have them, but I just found a box that does, so I included that in there. Additionally; this will not backup the system databases. Only user databases are backed up.

---
## Logic
```SQL
use master;
set nocount on
declare @backup_all_databases varchar(max)
set @backup_all_databases = ''
select @backup_all_databases = @backup_all_databases +
'backup database [' + name + '] to disk = ''\\MyShareName\' + replace(name, '', '''') + '.bak'' with format;' + char(10)
from sys.databases where name not in ('tempdb') 
order by name asc
exec (@backup_all_databases)

```

[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Info

| Build Quality | Build History |
|--|--|
|<table><tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr><tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr><tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr></table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|

## Author

- **李聪明的数据库 Lee's Clever Data**
- **Mike的数据库宝典 Mikes Database Collection**
- **李聪明的数据库** "Lee Songming"

[![Gist](https://img.shields.io/badge/Gist-李聪明的数据库-<COLOR>.svg)](https://gist.github.com/congmingshuju)
[![Twitter](https://img.shields.io/badge/Twitter-mike的数据库宝典-<COLOR>.svg)](https://twitter.com/mikesdatawork?lang=en)
[![Wordpress](https://img.shields.io/badge/Wordpress-mike的数据库宝典-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

---
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Lee Songming](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/1-clever-data-github.png "李聪明的数据库")


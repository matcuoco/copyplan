#Recupero delle dimensioni CopyPlan relative a Netbox

#Activity
use copyplan_test;
create table copyplan_activity
select
	 cod_activity_source as ActivityCode
    ,des ActivityName
from db_copyplan.activity
where cod_activity_source > 0
order by cod_activity_source;

#BuyMode --> Verificare BuyType & BuyCode
use copyplan_test;
create table copyplan_buymode
select
	 cod_buymode_source as BuyModeCode
    ,des as BuyModeName
from db_copyplan.buymode
where cod_buymode_source > 0
order by cod_buymode_source;

#Format
use copyplan_test;
drop table copyplan_format;
create table copyplan_format
select
	 f.cod_format_source as FormatCode
    ,f.des as FormatName
    ,g.cod_groupFormat_source as GroupCode
from db_copyplan.format f
	left join db_copyplan.group_format g
		on g.id = f.cod_grp
where f.cod_format_source > 0
and g.cod_groupFormat_source > 0
order by f.cod_format_source;

#GroupFormat
use copyplan_test;
create table copyplan_group_format
select
	 cod_groupFormat_source as GroupFormatCode
    ,des as GroupFormatName
from db_copyplan.group_format
where cod_groupFormat_source > 0
order by cod_groupFormat_source;

#Owner
use copyplan_test;
create table copyplan_owner
select
	 cod_owner_source as OwnerCode
    ,des as OwnerName
from db_copyplan.owner
where cod_owner_source > 0
order by cod_owner_source;

#Section
use copyplan_test;
create table copyplan_section
select
	 cod_section_source as SectionCode
    ,des as SectionName
from db_copyplan.section
where cod_section_source > 0
order by cod_section_source;

#Site
use copyplan_test;
create table copyplan_site
select
	 cod_site_source as SiteCode
    ,des as SiteName
from db_copyplan.site
where cod_site_source > 0
order by cod_site_source;

#Crea tabelle di data entry

#Righe CopyPlan
use copyplan_test;
create table copyplan_entry_line (
    RowId INT AUTO_INCREMENT PRIMARY KEY,
    VVKId VARCHAR(255) NOT NULL,
    PianoCode VARCHAR(255) NOT NULL,
    RowNo INT NOT NULL,
    Activity VARCHAR(255),
    MediaOwner VARCHAR(255),
    Site VARCHAR(255),
	Section VARCHAR(255),
	PackageName VARCHAR(255),
	PackageFormat VARCHAR(255),
	GroupFormat VARCHAR(255),
	FormatPlacement VARCHAR(255),
	SizeLenght VARCHAR(255),
	TipoValore VARCHAR(255),
	BuyingType VARCHAR(255),
	BuyingCode VARCHAR(255),
	URL VARCHAR(255),
	LandingPage VARCHAR(255),
	UTMGoogleAnalytics VARCHAR(255),
	BookedMediaAmount DECIMAL(19,2),
	FreeAmount DECIMAL(19,2),
	TotalCostNetAmount DECIMAL(19,2)
);

#Testata CopyPlan
use copyplan_test;
create table copyplan_entry_header (
	RowId INT AUTO_INCREMENT PRIMARY KEY,
    PianoCode VARCHAR(255) NOT NULL,
    CreationDate DATE
);





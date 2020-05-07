
create table Roles
(
	RoleName varchar(50)  primary key not null,
	RoleDescription varchar(256)
);

insert into Roles (RoleName, RoleDescription)
values('admin', 'All Privileges');

insert into Roles (RoleName, RoleDescription)
values('users', 'User/Friends Privileges');



create table UserAccounts_Roles
(
    UserLogonId int not null Constraint UserProfile_Roles_UserId Foreign Key References UserProfile(UserId),
    RoleName varchar(50) not null Constraint UserProfile_Roles_RoleName Foreign Key References Roles(RoleName),
    primary key(UserLogonId, RoleName)
);

insert into UserAccounts_Roles (UserLogonId, RoleName)
values('18', 'users');
insert into UserAccounts_Roles (UserLogonId, RoleName)
values('1', 'users');
insert into UserAccounts_Roles (UserLogonId, RoleName)
values('20', 'users');
insert into UserAccounts_Roles (UserLogonId, RoleName)
values('24', 'users');
insert into UserAccounts_Roles (UserLogonId, RoleName)
values('25', 'users');

--drop procedure GetUserRoles;

Go		
CREATE Procedure GetUserRoles (@UserLogonId varchar(50))
As
	select RoleName
	from UserAccounts_Roles
	where UserLogonId = @UserLogonId;


Create Procedure [dbo].[GetUserroles](@UserId int)
As

Set NoCount On
Select * from UserAccounts_Roles where UserLogonId=@UserId
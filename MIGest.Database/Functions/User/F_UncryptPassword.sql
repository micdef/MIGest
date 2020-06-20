CREATE FUNCTION [User].[F_UncryptPassword]
(
	@passwordC NVARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @i INT;
	DECLARE @password NVARCHAR(50);
	DECLARE @c NVARCHAR(1);
	SELECT @i = 0;
	SELECT @password = '';
	WHILE @i < len(@passwordC)
	BEGIN
		SELECT @i = @i+1;
		SELECT @c = SUBSTRING(@passwordC, @i, 1);
		SELECT @password = @password + NCHAR(255-ASCII(@c));
	END
	RETURN @password;
END

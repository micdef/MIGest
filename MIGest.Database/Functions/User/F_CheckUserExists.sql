CREATE FUNCTION [User].[F_CheckUserExists]
(
	@username NVARCHAR(50)
)
RETURNS BIT
AS
BEGIN
	DECLARE @cnt INTEGER = (SELECT COUNT(*) 
							FROM [User].[User] 
							WHERE [username] = @username);
	DECLARE @exists BIT;

	IF @cnt > 0
		SET @exists = 1
	ELSE
		SET @exists = 0

	RETURN @exists
END

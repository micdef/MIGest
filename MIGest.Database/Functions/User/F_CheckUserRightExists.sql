CREATE FUNCTION [User].[F_CheckUserRightExists]
(
	@username NVARCHAR(50),
	@right NVARCHAR(50)
)
RETURNS BIT
AS
BEGIN
	DECLARE @cnt INTEGER = (SELECT COUNT(*)
							FROM [User].[UserRight]
							WHERE [iduser] = (SELECT [iduser] 
											  FROM [User].[User] 
											  WHERE [username] = @username)
								AND [idright] = (SELECT [idright] 
												 FROM [User].[Right] 
												 WHERE [label] = @right));
	DECLARE @exists BIT;

	IF @cnt > 0
		SET @exists = 1
	ELSE
		SET @exists = 0

	RETURN @exists
END

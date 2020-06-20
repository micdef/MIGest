CREATE FUNCTION [User].[F_GetHash]
(
	@word NVARCHAR(50)
)
RETURNS VARBINARY(64)
AS
BEGIN
	RETURN HASHBYTES('SHA2_512', [User].[F_GetPresalt]() + @word + [User].[F_GetPostsalt]());
END

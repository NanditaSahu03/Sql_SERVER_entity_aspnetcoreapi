CREATE TABLE Roles
(
     RoleId TINYINT CONSTRAINT pk_RoleId PRIMARY KEY,
                                                      
     RoleName VARCHAR(20) NOT NULL
)
DROP INDEX pk_RoleId

ALTER TABLE ROLES DROP CONSTRAINT pk_RoleId


CREATE CLUSTERED INDEX idx_RoleId on Roles(RoleId)\

CREATE NONCLUSTERED INDEX idx_RoleName on Roles(RoleId)
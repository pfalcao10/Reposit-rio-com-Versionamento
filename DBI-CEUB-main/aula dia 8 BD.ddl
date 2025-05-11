-- Gerado por Oracle SQL Developer Data Modeler 21.1.0.092.1221
--   em:        2025-05-08 20:37:22 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Clientes 
    (
     nomeCliente VARCHAR (60) NOT NULL 
    )
GO

CREATE TABLE ClientesEnderecoCliente 
    (
     edc_cpfCliente VARCHAR (14) NOT NULL 
    )
GO

ALTER TABLE ClientesEnderecoCliente ADD CONSTRAINT ClientesEnderecoCliente_PK PRIMARY KEY CLUSTERED (edc_cpfCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ece 
    (
     cpfCliente VARCHAR (14) NOT NULL , 
     emailCliente VARCHAR (100) NOT NULL , 
     cpfCliente1 CHAR NOT NULL 
    )
GO

ALTER TABLE ece ADD CONSTRAINT ece_PK PRIMARY KEY CLUSTERED (cpfCliente, emailCliente, cpfCliente1)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE edc 
    (
     cpfCliente VARCHAR (14) NOT NULL , 
     logradouroEnderecoCliente VARCHAR (100) NOT NULL , 
     nroEnderecoCliente UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    NOT NULL , 
     complementoEnderecoCliente VARCHAR (100) NOT NULL , 
     cidadeEnderecoCliente VARCHAR (50) NOT NULL , 
     ufEnderecoCliente CHAR (2) NOT NULL , 
     cepEnderecoCliente VARCHAR (10) NOT NULL , 
     cpfCliente1 CHAR NOT NULL , 
     cpfCliente11 CHAR NOT NULL 
    )
GO

ALTER TABLE edc ADD CONSTRAINT edc_PK PRIMARY KEY CLUSTERED (cpfCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ips 
    (
     numeroPedido BIGINT NOT NULL , 
     codigoProduto INTEGER NOT NULL , 
     nomeProduto VARCHAR (100) NOT NULL , 
     precoUnitarioProduto DECIMAL (2) NOT NULL , 
     quantidadeProduto BIGINT NOT NULL , 
     Pedidos_numeroPedido BIGINT NOT NULL , 
     Pedidos_cpfCliente CHAR NOT NULL 
    )
GO

ALTER TABLE ips ADD CONSTRAINT ips_PK PRIMARY KEY CLUSTERED (numeroPedido, Pedidos_numeroPedido, Pedidos_cpfCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pedidos 
    (
     numeroPedido BIGINT NOT NULL , 
     nomeClientePedido VARCHAR (60) NOT NULL , 
     dataPedido DATE NOT NULL , 
     horaPedido TIME NOT NULL , 
     valorTotalPedido MONEY NOT NULL , 
     cpfCliente CHAR NOT NULL 
    )
GO

ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_PK PRIMARY KEY CLUSTERED (numeroPedido, cpfCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE tce 
    (
     cpfCliente VARCHAR (14) NOT NULL , 
     telefoneCliente VARCHAR (20) NOT NULL , 
     tipoTelefoneCliente VARCHAR (20) NOT NULL , 
     cpfCliente1 CHAR NOT NULL 
    )
GO

ALTER TABLE tce ADD CONSTRAINT tce_PK PRIMARY KEY CLUSTERED (cpfCliente, telefoneCliente, cpfCliente1)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE ClientesEnderecoCliente 
    ADD CONSTRAINT ClientesEnderecoCliente_Clientes_FK FOREIGN KEY 
    REFERENCES Clientes 
    ( 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ClientesEnderecoCliente 
    ADD CONSTRAINT ClientesEnderecoCliente_edc_FK FOREIGN KEY 
    ( 
     edc_cpfCliente
    ) 
    REFERENCES edc 
    ( 
     cpfCliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ece 
    ADD CONSTRAINT ece_Clientes_FK FOREIGN KEY 
    REFERENCES Clientes 
    ( 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE edc 
    ADD CONSTRAINT edc_Clientes_FK FOREIGN KEY 
    REFERENCES Clientes 
    ( 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE edc 
    ADD CONSTRAINT edc_Clientes_FKv2 FOREIGN KEY 
    REFERENCES Clientes 
    ( 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ips 
    ADD CONSTRAINT ips_Pedidos_FK FOREIGN KEY 
    ( 
     Pedidos_numeroPedido, 
     Pedidos_cpfCliente
    ) 
    REFERENCES Pedidos 
    ( 
     numeroPedido , 
     cpfCliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedidos 
    ADD CONSTRAINT Pedidos_Clientes_FK FOREIGN KEY 
    REFERENCES Clientes 
    ( 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE tce 
    ADD CONSTRAINT tce_Clientes_FK FOREIGN KEY 
    REFERENCES Clientes 
    ( 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0

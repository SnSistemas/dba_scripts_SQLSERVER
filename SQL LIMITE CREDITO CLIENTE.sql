----------- SQL QUE CORRIGE O LIMIETE DE CRÉDITO DO CLIENTE -----------
----------- AUTHOR: RUAN ALVES -----------

-- SQL QUE VERIFICA E CORRIGE O LIMITE DE CREDITO DO CLIENTE PELO CONTAS A RECEBER --
-- AUTHOR: RUAN ALVES --
UPDATE PESSOA SET VLCREDUTILIZADO = (SELECT ISNULL(SUM(VALOR),0) VALORUTILIZADO FROM CONTASARECEBER C, COBRANCA CB 
WHERE C.CODCOBRANCA=CB.CODCOBRANCA AND CB.TIPOCOBRANCA='APRAZO' AND STATUS ='A' AND C.CODCLIENTE=CODIGO)
GO
UPDATE PESSOA SET VLCREDDISPONIVEL= VLLIMITECRED- VLCREDUTILIZADO
GO

-- SQL QUE VERIFICA E CORRIGE O LIMITE DE CREDITO DO CLIENTE PELOS PEDIDOS --
-- AUTHOR: RUAN ALVES --
UPDATE PESSOA SET VLCREDUTILIZADO = (VLCREDUTILIZADO + (SELECT ISNULL(SUM(VLTOTNOTA),0) AS VALOR FROM CABPEDVENDA C, COBRANCA CB 
WHERE C.CODCOBRANCA = CB.CODCOBRANCA AND CB.TIPOCOBRANCA='APRAZO' AND C.CODCLIENTE = CODIGO
AND C.STATUS IN ('L','B') AND C.ISFATURADO = 0))
GO
UPDATE PESSOA SET VLCREDDISPONIVEL= VLLIMITECRED- VLCREDUTILIZADO
GO
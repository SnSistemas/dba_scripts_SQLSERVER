DELETE FROM PRECOTABELA WHERE CODPRODUTOPRECO = 0
GO
DELETE FROM DESCONTOQUANTIDADE WHERE CODPRODUTO = 0
GO
DELETE FROM PRODUTO_COMPLEMENTOS WHERE CODPRODUTO = 0
GO
DELETE FROM PRECO_ESTOQUE WHERE CODPRODUTO = 0
GO
DELETE FROM PRODUTO WHERE CODIGO = 0
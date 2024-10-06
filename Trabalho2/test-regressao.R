data("salarios")

test_that("Teste da função de regressão", {
  resultado <- regressao(salarios, "salario")
  modelo_lm <- lm(salario ~ ., data = salarios)
  coef<- as.matrix(coef(modelo_lm))
  colnames(coef)<-c(colnames(coef)[1],"salario")

  expect_type(resultado, "list")
  expect_named(resultado, c("beta_hat", "preditos", "residuos"))
  expect_true(is.matrix(resultado$beta_hat))
  expect_equal(length(resultado$preditos), nrow(salarios) - sum(is.na(salarios)))
  expect_equal(length(resultado$residuos), nrow(salarios) - sum(is.na(salarios)))
  expect_equal(resultado$beta_hat, coef)
  expect_error(regressao(matrix(1:10, nrow=5), "salario"),
               "A entrada 'dados' deve ser um data frame.")
  expect_error(regressao(salarios, 123),
               "A entrada 'y' deve ser uma string com o nome da variável dependente.")
  expect_error(regressao(salarios,"renda"),
               "A variável renda não está presente no data frame 'dados'.")
})

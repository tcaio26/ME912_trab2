data("salarios")

test_that("Teste da função de regressão", {
  # Testar se a função retorna uma lista
  resultado <- regressao(salarios, "salario")
  expect_type(resultado, "list")

  # Testar se os coeficientes estão corretos
  expect_true("beta_hat" %in% names(resultado))
  expect_true(is.matrix(resultado$beta_hat))

  # Testar se os preditos têm o mesmo comprimento que os dados
  expect_equal(length(resultado$preditos), nrow(salarios) - sum(is.na(salarios)))

  # Testar se os resíduos têm o mesmo comprimento que os dados
  expect_equal(length(resultado$residuos), nrow(salarios) - sum(is.na(salarios)))
})

test_that("Teste da função de predição", {
  # Obter os coeficientes da regressão
  resultado_regressao <- regressao(salarios, "salario")
  beta_hat <- resultado_regressao$beta_hat

  # Criar um novo conjunto de dados para predição
  novos_dados <- data.frame(
    id= c(1001, 1002, 1003),
    idade = c(30, 45, 50),
    altura = c(175, 180, 165),
    peso = c(80, 90, 70),
    anos_estudando = c(12, 16, 14),
    filhos = c(1, 2, 0)
  )
  preditos_novos <- predicao(novos_dados, beta_hat)
  expect_equal(length(preditos_novos), nrow(novos_dados))
})

test_that("Teste da função de gráficos", {
  resultado <- regressao(salarios, "salario")
  graficos_resultado <- graficos(resultado$preditos, resultado$preditos, resultado$residuos)
  expect_s3_class(graficos_resultado$preditos_vs_observados, "gg")
  expect_s3_class(graficos_resultado$residuos, "gg")
})




predicao <- function(novos_dados, beta_hat) {
  # Verificar se 'novos_dados' é um data frame
  if (!is.data.frame(novos_dados)) {
    stop("A entrada 'novos_dados' deve ser um data frame.")
  }

  # Verificar se todos os preditores são numéricos
  if (!all(sapply(novos_dados, is.numeric))) {
    stop("Todos os preditores devem ser numéricos.")
  }

  # Adicionar a coluna de intercepto
  novos_dados <- as.matrix(cbind(1, novos_dados))

  # Calcular as predições
  preditos_novos <- novos_dados %*% beta_hat

  return(preditos_novos)
}



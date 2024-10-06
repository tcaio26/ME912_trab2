#' @title Predição para novos valores
#'
#' @usage predicao(novos_dados, beta_hat)
#'
#' @description
#' Retorna valores preditos para novas observações, com base no modelo ajustado por \code{regressao}
#'
#' @param novos_dados data frame com variaveis identicas às usadas para o ajuste do modelo em \code{regressao}
#' @param beta_hat coeficientes providenciados por modelo$beta_hat
#'
#' @return vetor de valores preditos.
#' @export
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



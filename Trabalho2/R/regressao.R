#' @title Modelo de regressão linear
#' @description
#' Ajusta um modelo de regressão linear para o data frame \code{dados} e variável resposta \code{y} fornecidos.
#'
#' @usage regressao(dados, y)
#'
#' @param dados data frame com apenas variáveis numéricas, incluindo a variável resposta.
#' @param y nome ou posicção da coluna para ser utilizada como variável resposta.
#'
#'
#' @return Uma lista:
#' \itemize{
#'  \item \code{beta_hat} coeficientes beta estimados
#'  \item \code{preditos} valores preditos para o banco de dados
#'  \item \code{residuos} residuos do modelo
#'}
#'
#' @import dplyr
#' @export
regressao <- function(dados, y){
  dados<- na.omit(dados)
  # Verificar se 'dados' é um data frame
  if (!is.data.frame(dados)) {
    stop("A entrada 'dados' deve ser um data frame.")
  }

  # Verificar se 'y' é uma string
  if (!is.character(y) || length(y) != 1) {
    stop("A entrada 'y' deve ser uma string com o nome da variável dependente.")
  }

  # Verificar se 'y' está presente em 'dados'
  if (!y %in% colnames(dados)) {
    stop(paste("A variável", y, "não está presente no data frame 'dados'."))
  }
  x <- select(dados, -y)
  # Verificar se existem preditores
  if (ncol(x) == 0) {
    stop("Não existem variáveis preditoras após remover 'y'.")
  }

  if (!all(sapply(x, is.numeric))) {
    stop("Todos os preditores devem ser numéricos.")
  }

  x <- as.matrix(cbind(1, x))
  x_transp <- t(x)
  y <- as.matrix(select(dados, all_of(y)))
  beta_hat<- solve(x_transp %*% x) %*% x_transp %*% y
  preditos <- x %*% beta_hat
  residuos <- y - preditos
  return(list(beta_hat = beta_hat, preditos = preditos, residuos = residuos))
}





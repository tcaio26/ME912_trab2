#' @title Gráficos para o modelo de regressão linear
#'
#' @description
#' Gera gráficos de valores preditos contra valores observados e um gráfico de resíduos contra valores observados.
#'
#' @usage graficos(modelo)
#'
#' @param modelo um objeto gerado pela função regressao
#'
#' @return dois gráficos:
#' \itemize{
#'  \item \code{preditos_vs_observados} Valores preditos (y) contra valores observados (x)
#'  \item \code{residuos} Resíduos (y) contra valores observados (x)
#' }
#' @import ggplot2
#' @export
graficos <- function(modelo) {
  if(any(names(modelo)!=c("beta_hat","preditos","residuos"))) stop("forneça um modelo gerado pela função 'regressao()'")
  #extrair os componentes do modelo
  observados = modelo$preditos + modelo$residuos
  preditos = modelo$preditos
  residuos = modelo$residuos
  # Criar um data frame com observados, preditos e resíduos
  dados <- data.frame(
    Observados = as.vector(observados),
    Preditos = as.vector(preditos),
    Residuos = as.vector(residuos)
  )

  # Gráfico de observados vs preditos
  grafico_preditos_vs_observados <- ggplot(dados, aes(x = Observados, y = Preditos)) +
    geom_point(color = "blue") +
    geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +
    labs(title = "Valores Observados vs Preditos", x = "Observados", y = "Preditos") +
    theme_bw()

  # Gráfico dos resíduos
  grafico_residuos <- ggplot(dados, aes(x = Observados, y = Residuos)) +
    geom_point(color = "purple") +
    geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
    labs(title = "Gráfico de Resíduos", x = "Observados", y = "Resíduos") +
    theme_bw()

  # Retornar os gráficos como uma lista
  return(list(preditos_vs_observados = grafico_preditos_vs_observados,
              residuos = grafico_residuos))
}




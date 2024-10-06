
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Trabalho2

<!-- badges: start -->
<!-- badges: end -->

O objetivo do Trabalho 2 é criar um pacote com funções e um banco de
dados para que o usuário possa fazer Regressões Lineares. O pacote foi
criado em R e sua distribuição é feita a partir do GitHub.

## Instalação

Você pode instalar a versão atualizada do pacote em
[GitHub](https://github.com/tcaio26/ME912_trab2) com:

``` r
# install.packages("devtools")
devtools::install_github("tcaio26/ME912_trab2/Trabalho2")
```

## Exemplo

Esse é um exemplo básico de como você pode resolver um problema de
regressão usando o pacote:

``` r
library(Trabalho2)
```

Carregando o banco de dados simulado:

``` r
data = Trabalho2::salarios
```

Aplicando a função `regressao` no banco de dados:

Saídas do modelo:

``` r
betas = modelo$beta_hat

residuos = modelo$residuos

preditos = modelo$preditos
```

Predição para novos valores:

``` r
novos_valores = data.frame(
    idade = c(30, 45, 50),
    altura = c(175, 180, 165),
    peso = c(80, 90, 70),
    anos_estudando = c(12, 16, 14),
    filhos = c(1, 2, 0)
  )

preditos = predicao(novos_valores, betas)
```

``` r
head(preditos)
#>       salario
#> [1,] 18768.45
#> [2,] 23940.82
#> [3,] 27950.29
```

Gráficos do modelo:

``` r
plot = graficos(modelo)
```

Valores preditos vs observados:

``` r
plot$preditos_vs_observados
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

Resíduos:

``` r
plot$residuos
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

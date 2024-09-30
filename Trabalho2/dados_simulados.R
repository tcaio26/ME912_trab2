##variaveis: id, idade, altura, peso, salario, anos_estudando, filhos
library(faux)
library(GGally)
library(dplyr)
dados = data.frame(id=0,idade=0,anos_estudando=0,filhos=0,salario=0)

set.seed(247005)
id = idade = salario = anos_estudando = filhos = 0
for(i in 1:1000){
  id = i
  idade = round(rgamma(1, 35,1), 0)
  anos_estudando = ifelse(idade>22, rnorm(1,16,1.5), ifelse(idade<6,0,rnorm(1,idade-6,1)))
  filhos = ifelse(idade>17,floor(rgamma(1,idade-10,15)),0)
  salario = ((0.9^filhos)*((idade-16)/5)*(2/3)+(log(anos_estudando))+rnorm(1,2,1))*3000
  dados = rbind(dados, c(id, idade, anos_estudando, filhos, salario))
}

dados = dados[-1,] %>% cbind(data.frame(rnorm_multi(1000, 2, mu = c(165, 65), sd = c(8, 7), r = 0.6, varnames = c('altura','peso')))) %>% 
  dplyr::select(c('id', 'idade', 'altura', 'peso', 'anos_estudando', 'filhos', 'salario'))

ggpairs(dados[,-1])

lm(salario~., dados) %>% summary()

write.csv(dados, "salarios.csv")
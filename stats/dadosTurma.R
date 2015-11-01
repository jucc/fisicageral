# dataset da turma de fisica geral

l = "../dados/dadosTurma.csv"
turma <- read.table(l, skip = 0,  sep = ",", comment.char = '')
colnames(turma) <- c("idade", "peso", "altura")

# medias com e sem a professora
mean(turma$idade)
mean(turma$idade[1:19])

mean(turma$peso)
mean(turma$peso[1:19])

mean(turma$altura)
mean(turma$altura[1:19])

# desvio com e sem a professora

sd(turma$idade)
sd(turma$idade[1:19])

sd(turma$peso)
sd(turma$peso[1:19])

sd(turma$altura)
sd(turma$altura[1:19])

# medianas

median(turma$peso)
median(turma$idade)
median(turma$altura)

# graficos

PDFPath = "../relatorios//dadosTurma_graficos.pdf"
pdf(file=PDFPath)
par(mfrow=c(3,1))

  #boxplots

boxplot(turma$idade, horizontal=TRUE)
boxplot(turma$altura, horizontal=TRUE)
boxplot(turma$peso, horizontal=TRUE)

  #histogramas

par(mfrow=c(2,1))
colours = c("red", "cyan", "yellow", "green", "orange", "blue", "pink", "violet", "brown")

hist(turma$idade[1:19], right=FALSE, nclass=6, col=colours, main="Idade sem a prof", xlab="Idades")
grid(col = "lightgray", lty = "dotted")
hist(turma$idade[1:20], right=FALSE, nclass=9, col=colours, main="Idade com a prof", xlab="Idades")
grid(col = "lightgray", lty = "dotted")
hist(turma$peso, right=FALSE, nclass=9, col=colours, main="Peso", xlab="Pesos (kg)")
grid(col = "lightgray", lty = "dotted")
hist(turma$altura, right=FALSE, nclass=4, col=colours, main="Altura", xlab="Alturas (cm)")
grid(col = "lightgray", lty = "dotted")

  #scatterplots

par(mfrow=c(1,1))

plot(turma$peso, turma$altura, xlab="Peso (kg)", ylab="Altura (cm)")
# cria um modelo linear (lm) e traca uma reta tendencia (abline)
mylm = lm(turma$altura ~ turma$peso)
abline(mylm)
grid(col = "lightgray", lty = "dotted")
abline(h=mean(turma$altura), col = "cyan")
abline(h=median(turma$altura), col = "yellow")
abline(v=mean(turma$peso), col = "cyan")
abline(v=median(turma$peso), col = "yellow")

plot(turma$idade[1:19], turma$peso[1:19],  xlab="Idade (sem a prof)", ylab="Peso (kg)")
grid(col = "lightgray", lty = "dotted")
abline(h=mean(turma$peso), col = "cyan")
abline(h=median(turma$peso), col = "yellow")
abline(v=mean(turma$idade), col = "cyan")
abline(v=median(turma$idade), col = "yellow")

plot(turma$idade[1:19], turma$altura[1:19], xlab="Idade (sem a prof)", ylab="Altura (cm)")
grid(col = "lightgray", lty = "dotted")
abline(h=mean(turma$altura), col = "cyan")
abline(h=median(turma$altura), col = "yellow")
abline(v=mean(turma$idade), col = "cyan")
abline(v=median(turma$idade), col = "yellow")

dev.off() 

# covariancia e correlacao

cov(turma$peso, turma$altura)
cor(turma$peso, turma$altura)
cov(turma$peso[1:19], turma$altura[1:19])
cor(turma$peso[1:19], turma$altura[1:19])

cov(turma$peso, turma$idade)
cor(turma$peso, turma$idade)
cov(turma$peso[1:19], turma$idade[1:19])
cor(turma$peso[1:19], turma$idade[1:19])

cov(turma$idade, turma$altura)
cor(turma$idade, turma$altura)
cov(turma$idade[1:19], turma$altura[1:19])
cor(turma$idade[1:19], turma$altura[1:19])

# curiosidade

ju=c(31, 76, 150 )
turma = rbind(turma, ju)
turma$imc = turma$peso / ((turma$altura / 100) ^ 2)

boxplot(turma$imc, horizontal=TRUE)
boxplot(turma$altura, horizontal=TRUE)
boxplot(turma$idade, horizontal=TRUE)
boxplot(turma$idade[1:19], horizontal=TRUE)

hist(turma$imc, right=FALSE, nclass=4, col=colours)

cor(turma$peso, turma$imc)
cor(turma$idade, turma$imc)
cor(turma$altura, turma$imc)
plot(turma$peso, turma$imc)
mylm = lm(turma$imc ~ turma$peso)
abline(mylm)

plot(turma$idade, turma$altura)

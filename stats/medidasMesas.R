# dataset das mesas da sala de fisica geral

l = "../dados/medidasMesas.csv"
mesas <- read.table(l, skip = 0,  sep = ",", comment.char = '')
colnames(mesas) <- c("largura", "comprimento")
mesas$area = mesas$largura * mesas$comprimento / 10000

# medidas
meanL = mean(mesas$largura)
meanC = mean(mesas$comprimento)
print (meanL)
print (meanC)
meanLC = meanL * meanC / 10000
meanA = mean(mesas$area)
print (meanLC)
print (meanA)
meanA / meanLC
sd(mesas$largura)
sd(mesas$comprimento)

min(mesas$larg)
max(mesas$largura)
min(mesas$comprimento)
max(mesas$comprimento)
min(mesas$area)
max(mesas$area)

# graficos

PDFPath = "../relatorios/medidasMesas_graficos.pdf"
pdf(file=PDFPath)
par(mfrow=c(3,1))

  #boxplots

boxplot(mesas$largura, horizontal=TRUE)
boxplot(mesas$comprimento, horizontal=TRUE)
boxplot(mesas$area, horizontal=TRUE)

  #histogramas

colours = c("red", "orange", "yellow", "green", "cyan", "blue", "violet")

hist(mesas$largura, right=FALSE, breaks=seq(149.4,150.6,l=7), col=colours, main="Largura", xlab="Largura (cm)")
grid(col = "lightgray", lty = "dotted")
hist(mesas$comprimento, right=FALSE, breaks=seq(74.7,75.3,l=7), col=colours, main="Comprimento", xlab="Comprimento (cm)")
grid(col = "lightgray", lty = "dotted")
hist(mesas$area, right=FALSE, breaks=seq(1.120,1.132,l=7), col=colours, main="Area", xlab="Area (m²)")
grid(col = "lightgray", lty = "dotted")

#scatterplots

par(mfrow=c(1,1))

plot(mesas$largura, mesas$comprimento, xlab="Largura (cm)", ylab="Comprimento (cm)")
# cria um modelo linear (lm) e traca uma reta tendencia (abline)
mylm = lm(mesas$largura ~ mesas$comprimento)
abline(mylm)
grid(col = "lightgray", lty = "dotted")
abline(h=mean(mesas$largura), col = "cyan")
abline(h=median(mesas$largura), col = "yellow")
abline(v=mean(mesas$comprimento), col = "cyan")
abline(v=median(mesas$comprimento), col = "yellow")

dev.off() 

# covariancia e correlacao

cov(mesas$largura, mesas$comprimento)
cor(mesas$largura, mesas$comprimento)


l<-c (150.2,149.9)

# le o arquivo com as medidas de tensao e corrente
l = "../dados/leiohm.csv"
ohm <- read.table(l, skip = 0,  sep = ",", comment.char = '')
colnames(ohm) <- c("V", "i1", "i2", "is", "ip")

# calcula e plota as retas de fit linear

l1 = lsfit(ohm$i1, ohm$V)
l2 = lsfit(ohm$i2, ohm$V)
ls = lsfit(ohm$is, ohm$V)
lp = lsfit(ohm$ip, ohm$V)

ls.print(l1)
ls.print(l2)
ls.print(ls)
ls.print(lp)


jpeg('../images/Vi1.jpg')
plot(ohm$i1, ohm$V, xlab="i1(mA)", ylab="V(V)", xaxt="n", yaxt="n")
axis(side=1, at=seq(0, 2.0, 0.2), labels=sprintf("%.1f", seq(0, 2.0, 0.2)))
axis(side=2, at=ohm$V, labels=sprintf("%.0f", ohm$V))
abline(v=seq(0, 2, 0.2), col="lightgray", lty="dotted")
abline(h=ohm$V, col="lightgray", lty="dotted")
abline(l1, col="orange")
dev.off()

jpeg('../images/Vi2.jpg')
plot(ohm$i2, ohm$V, xlab="i2(mA)", ylab="V(V)", xaxt="n", yaxt="n")
axis(side=1, at=seq(0, 2.0, 0.2), labels=sprintf("%.1f", seq(0, 2.0, 0.2)))
axis(side=2, at=ohm$V, labels=sprintf("%.0f", ohm$V))
abline(v=seq(0, 2, 0.2), col="lightgray", lty="dotted")
abline(h=ohm$V, col="lightgray", lty="dotted")
abline(l2, col="orange")
dev.off()

jpeg('../images/Vis.jpg')
plot(ohm$is, ohm$V, xlab="i-serie(mA)", ylab="V(V)", xaxt="n", yaxt="n")
axis(side=1, at=seq(0, 1.0, 0.1), labels=sprintf("%.1f", seq(0, 1.0, 0.1)))
axis(side=2, at=ohm$V, labels=sprintf("%.0f", ohm$V))
abline(v=seq(0, 1, 0.1), col="lightgray", lty="dotted")
abline(h=ohm$V, col="lightgray", lty="dotted")
abline(ls, col="orange")
dev.off()

jpeg('../images/Vip.jpg')
plot(ohm$ip, ohm$V, xlab="i-paralelo(mA)", ylab="V(V)", xaxt="n", yaxt="n")
axis(side=1, at=seq(0, 4.0, 0.4), labels=sprintf("%.1f", seq(0, 4.0, 0.4)))
axis(side=2, at=ohm$V, labels=sprintf("%.0f", ohm$V))
abline(v=seq(0, 4, 0.4), col="lightgray", lty="dotted")
abline(h=ohm$V, col="lightgray", lty="dotted")
abline(lp, col="orange")
dev.off()


# outras contas para as tabelas


ohm$r1 = ohm$V / (ohm$i1 * 10^-3)
ohm$r2 = ohm$V / (ohm$i2 * 10^-3)
ohm$rs = ohm$V / (ohm$is * 10^-3)
ohm$rp = ohm$V / (ohm$ip * 10^-3)

e1=sqrt(sum(((l1$residuals)^2)/8))
e2=sqrt(sum(((l2$residuals)^2)/8))
es=sqrt(sum(((ls$residuals)^2)/8))
ep=sqrt(sum(((lp$residuals)^2)/8))

mv = mean(ohm$V)

c1 = cov(ohm$i1, ohm$V)
s1 = sd(ohm$i1)
m1 = mean(ohm$i1)
a1 = c1/(s1^2)
b1 = mv - a1*m1

c2 = cov(ohm$i2, ohm$V)
s2 = sd(ohm$i2)
m2 = mean(ohm$i2)
a2 = c2/(s2^2)
b2 = mv - a2*m2

cs = cov(ohm$is, ohm$V)
ss = sd(ohm$is)
ms = mean(ohm$is)
as = cs/(ss^2)
bs = mv - as*ms

cp = cov(ohm$ip, ohm$V)
sp = sd(ohm$ip)
mp = mean(ohm$ip)
ap = cp/(sp^2)
bp = mv - ap*mp


sa1 = e1/(s1 * sqrt(10))
sa2 = e2/(s2 * sqrt(10))
sas = es/(ss * sqrt(10))
sap = ep/(sp * sqrt(10))

sa1 * sqrt(sd((ohm$i1)^2))
sa2 * sqrt(sd((ohm$i2)^2))
sas * sqrt(sd((ohm$is)^2))
sap * sqrt(sd((ohm$ip)^2))


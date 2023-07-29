na <- read.table("NA_CA.un.0.txt")
na_bs = list.files(pattern="NA_CA.un.combined.*.txt", full.names = TRUE)


jpeg(file="NA_CA_un.jpeg",width = 1200, height = 700)

par(mar = c(5, 6, 3, 3))

plot(na$V1/1000,na$V2,ylim=c(0,14),log="x",type="n",lwd="3",xlab="",ylab="",axes=F,cex.main=1.75)
rect(0.1,12,127,14, col=scales::alpha(rgb(col2rgb("cyan")[1,],col2rgb("cyan")[2,],col2rgb("cyan")[3,],max = 255), 0.25),border="transparent")
text(7,12.8,"Holocene",cex=1.75,font=4)
rect(128,12,2580,14, col=scales::alpha(rgb(col2rgb("yellow")[1,],col2rgb("yellow")[2,],col2rgb("yellow")[3,],max = 255), 0.25),border="transparent")
text(200,12.8,"Pleistocene",cex=1.75,font=4)
rect(900,0,1800,14, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
text(1200,12,"MIS-63-23",cex=1.75,font=4,srt=90)
rect(337,0,374,14, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
text(350,12.8,"MIS-10",cex=1.75,font=4,srt=90)
rect(424,0,478,14, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
text(450,12.8,"MIS-12",cex=1.75,font=4,srt=90)
rect(11.7,0,115,14, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
text(35,12.8,"Last Glacial Period",cex=1.75,font=4)
rect(2580,12,5330,14, col=scales::alpha(rgb(col2rgb("green")[1,],col2rgb("green")[2,],col2rgb("green")[3,],max = 255), 0.25),border="transparent")
text(3500,12.8,"Pliocene",cex=1.75,font=4)
axis(1, col="black",las=1,font=2,font.axis=4,cex.axis=1.75)
mtext(side=1, line=3.2, "Years (KYA)", col="black", font=2,cex=2)
axis(2, col="black",las=1,font=2,font.axis=4,cex.axis=1.75)
mtext(side=2, line=3.2, expression(bold("Effective Population Size x 10"^4)),col="black", font=2,cex=2)

for (i in na_bs){
read.table(file=i,header=FALSE)-> na_bs_all
lines(na_bs_all$V1/1000,na_bs_all$V2, type="s",col=scales::alpha(rgb(col2rgb("red")[1,],col2rgb("red")[2,],col2rgb("red")[3,],max = 255), 0.15))
}
lines(na$V1/1000,na$V2,type="s",col="red",lwd=3)

abline(v=800,lwd=4,lty=3)
text(2000,0.1,"Ancient Time Period",cex=1.75,font=4)
abline(v=50,lwd=4,lty=3)
text(250,0.1,"Mid-Time Period",cex=1.75,font=4)
text(10,0.1,"Recent Time Period",cex=1.75,font=4)
box()

dev.off()



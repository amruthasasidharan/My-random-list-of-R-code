set.seed(123)
par(mar=c(1,2,1,0))
x=rnorm(n = 15,mean = rep(x = 1:5,each=5),sd = 0.2)
y=rnorm(n = 15,mean = rep(c(1,2,1),each=5),sd = 0.2)
#create points such that 5 points in each cluster
plot(x,y,col="blue",pch=19)
data=data.frame(x,y)
#-----------hierarchical clustering------------------------------------------
distance=dist(data,method = "euclidean")
hierarchical=hclust(distance)
plot(hierarchical)
#cutting tree at y=2.0
rect.hclust(tree = hierarchical,k = 3)
#-------plotting hclust different ways-----------------------------
#----------------using plot.dendogram---------------------------
hcdendo=as.dendrogram(hierarchical)
# Default plot
plot(hcdendo, type = "rectangle", ylab = "Height")
# Triangle plot
plot(hcdendo, type = "triangle", ylab = "Height")
# Define nodePar
nodePar=list(lab.cex = 0.6, pch = c(NA, 19), 
                cex = 0.7, col = "blue")
# Customized plot; remove labels
plot(hcdendo, ylab = "Height", nodePar = nodePar, leaflab = "none")
plot(hcdendo, ylab = "Height", nodePar = nodePar)
# Horizontal plot
plot(hcdendo,  xlab = "Height",nodePar = nodePar, horiz = TRUE)
# Change edge color
plot(hcdendo,  xlab = "Height", nodePar = nodePar,edgePar = list(col = 2:3, lwd = 2:1))
#-----------------using ggdendro------------------
ggdendro::ggdendrogram(hierarchical)
ggdendro::ggdendrogram(hierarchical,rotate = TRUE)
#---------------------------Hierarchical clustering completed----------------------------

#-----------------kmeans clustering-----------------------------
kmeansobj=kmeans(x = data,centers = 3)
kmeansobj
plot(data,col=kmeansobj$cluster,pch=22)
points(kmeansobj$centers,pch=19,col="blue")

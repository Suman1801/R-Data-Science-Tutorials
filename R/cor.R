view(spearman_matrix)

AA <- cor(Cor_R)
View(AA)
cor(X5000_Point_Data_Copy)
newcorr<-round(cor(cor),4)

install.packages("GGally")
library(GGally)

install.packages("showtext")
library(showtext)
font_add_google(name = "times ", family = "amatic-sc")



library(GGally)
library(ggplot2)

# Create the ggpairs plot
plot <- ggpairs(
  data = Cor_R,
  upper = list(continuous = "cor"),
  lower = list(continuous = "points"),
  diag = list(continuous = "densityDiag")
) 

# Add a title and center it
plot + ggtitle("Correlation Matrix Plot") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14))


ggpairs(data = Cor_R,
        upper = list(continuous = "cor"),
        lower = list(continious = "points"),
        diag = list(continious = "densityDiag"))



library(ggcorrplot)
library(ggplot2)

ggcorrplot(AA)
ggcorrplot(AA,outline.color = "black",type = "upper",lab = T,lab_size = 4)

ggcorrplot (spearman_matrix,method =  "squar",outline.color = "black",type = "upper",lab = T,lab_size = 4,
           legend.title = "Correlation", show.diag = NULL,  show.legend = TRUE,
           theme(tex= element_text(family = "Times New Roman"))









#looking at total allocation received by Ivy League Schools

coronacash<-read.csv("~/Downloads/data-oDYXT.csv")

#subset Ivys from larger dataset 
Harvard<-subset(coronacash,School=="Harvard University")
Yale<-subset(coronacash,School=="Yale University")
Dartmouth<-subset(coronacash,School=="Dartmouth College")
Princeton<-subset(coronacash,School=="Princeton University")
Cornell<-subset(coronacash,School=="Cornell University")
Brown<-subset(coronacash,School=="Brown University")
UPenn<-subset(coronacash,School=="University Of Pennsylvania")
Columbia<-subset(coronacash,School=="Columbia University In The City Of New York")
Barnard<-subset(coronacash,School=="Barnard College")


merge1<-rbind.data.frame(Harvard,Yale)
merge2<-rbind.data.frame(Dartmouth,Princeton)
merge3<-rbind.data.frame(Cornell,Brown)
merge4<-rbind.data.frame(UPenn,Columbia)
merge5<-rbind.data.frame(merge1,merge2)
merge6<-rbind.data.frame(merge3,merge4)
IvyData<-rbind.data.frame(merge5,merge6)
IvyNardData<-rbind.data.frame(IvyData,Barnard)

library(ggplot2)
theme_set(theme_bw())  

# Data Prep
IvyData$`School` -> rownames(IvyData)  # create new column for School names
IvyData$Total.Allocation <- round((IvyData$Total.Allocation - mean(IvyData$Total.Allocation))/sd(IvyData$Total.Allocation), 2)  # compute normalized TA
IvyData$TA_Type <- ifelse(IvyData$Total.Allocation < 0, "below", "above")  # above / below avg flag
IvyData <- IvyData[order(IvyData$Total.Allocation), ]  # sort
IvyData$`School` <- factor(IvyData$`School`, levels = IvyData$`School`)  # convert to factor to retain sorted order in plot.

# Diverging Barcharts
ggplot(IvyData, aes(x=`School`, y=Total.Allocation, label=Total.Allocation)) + 
  geom_bar(stat='identity', aes(fill=TA_Type), width=.5)  +
  scale_fill_manual(name="Total Allocation", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(#subtitle="Normalised total allocation from 'IvyData'", 
       title= "Normalized Total Allocation across the Ivy League") + 
  coord_flip()

library(ggplot2)
theme_set(theme_bw())

ggplot(IvyData, aes(x=`School`, y=Total.Allocation, label=Total.Allocation)) + 
  geom_point(stat='identity', fill="blue", size=6)  +
  geom_segment(aes(y = 0, 
                   x = `School`, 
                   yend = Total.Allocation, 
                   xend = `School`), 
               color = "black") +
  geom_text(color="white", size=2) +
  labs(title="Normalized Total Allocation across the Ivy League", 
       subtitle="Normalized mileage from 'IvyData': Lollipop") + 
  ylim(-2.5, 2.5) +
  coord_flip()





# Data Prep
IvyData$`School` -> rownames(IvyData)  # create new column for School names
IvyData$Total.Allocation <- round((IvyData$Total.Allocation - mean(coronacash$Total.Allocation))/sd(coronacash$Total.Allocation), 2)  # compute normalized TA
IvyData$TA_Type <- ifelse(IvyData$Total.Allocation < 0, "below", "above")  # above / below avg flag
IvyData <- IvyData[order(IvyData$Total.Allocation), ]  # sort
IvyData$`School` <- factor(IvyData$`School`, levels = IvyData$`School`)  # convert to factor to retain sorted order in plot.

# Diverging Barcharts
ggplot(IvyData, aes(x=`School`, y=Total.Allocation, label=Total.Allocation)) + 
  geom_bar(stat='identity', aes(fill=TA_Type), width=.5)  +
  scale_fill_manual(name="Total Allocation", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(#subtitle="Normalised total allocation from 'IvyData'", 
    title= "Normalized Total Allocation across the Ivy League") + 
  coord_flip()


I








sd(coronacash$Total.Allocation)








library(ggplot2)
theme_set(theme_bw())


merge1<-rbind.data.frame(Harvard,Yale)
merge2<-rbind.data.frame(Dartmouth,Princeton)
merge3<-rbind.data.frame(Cornell,Brown)
merge4<-rbind.data.frame(UPenn,Columbia)
merge5<-rbind.data.frame(merge1,merge2)
merge6<-rbind.data.frame(merge3,merge4)
IvyData<-rbind.data.frame(merge5,merge6)
IvyNardData<-rbind.data.frame(IvyData,Barnard)



# Data Prep
IvyNardData$`School` -> rownames(IvyNardData)  # create new column for School names
IvyNardData$Total.Allocation <- round((IvyNardData$Total.Allocation - mean(IvyNardData$Total.Allocation))/sd(IvyNardData$Total.Allocation), 2)  # compute normalized TA
IvyNardData$TA_Type <- ifelse(IvyNardData$Total.Allocation < 0, "below", "above")  # above / below avg flag
IvyNardData <- IvyNardData[order(IvyNardData$Total.Allocation), ]  # sort
IvyNardData$`School` <- factor(IvyNardData$`School`, levels = IvyNardData$`School`)  # convert to factor to retain sorted order in plot.

ggplot(IvyNardData, aes(x=`School`, y=Total.Allocation, label=Total.Allocation)) + 
  geom_point(stat='identity', fill="blue", size=6)  +
  geom_segment(aes(y = 0, 
                   x = `School`, 
                   yend = Total.Allocation, 
                   xend = `School`), 
               color = "black") +
  geom_text(color="white", size=2) +
  labs(title="Normalized Total Allocation across the Ivy League", 
       subtitle="Normalized allocation from 'IvyData': Lollipop") + 
  ylim(-2.5, 2.5) +
  coord_flip()








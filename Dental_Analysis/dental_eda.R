library(tidyverse)


fluoride_df <- read_csv("../Clean_Data/Flouride_2019-2023.csv")

glimpse(fluoride_df)

#rename columns
fluoride_df <- fluoride_df %>% rename("PWS_ID"="PWS ID" ,"PWS_Name"="PWS Name","Population_Served"="Population Served","Fluoride_Product"="Fluoride Product","Water_Source"= "Water Source")
              
              
#There are 1632 distinct PWS present in the state of Florida between 2019-2023
distinct_pws_ids <- fluoride_df %>% distinct(`PWS_ID`)

#Key features that can be used beyond serving as an id or location are [status,population_served,fluoride_product,fluoridated,water_source]

#It seems that all locations of pws only have primary counties and don't have association with a secondary or tertiary
                                      
primary_county_count <- length(fluoride_df$County)- sum(grepl("Primary",fluoride_df$County,ignore.case=TRUE))


distinct_pws_name <- fluoride_df %>% distinct(`PWS_Name`)

#look at individual categorical counts
status_value_counts <- fluoride_df %>% count(`Status`)

fluoride_product_value_counts <- fluoride_df %>% count(`Fluoride_Product`)

water_source_value_counts <- fluoride_df %>% count(`Water_Source`)


#categorical_value_counts <- fluoride_df %>% count(Status,`Fluoride Product`,`Water Source`)
 
#ggplot(data=fluoride_df) + geom_bar(mapping=aes(x=Status)) + facet_wrap(`Fluoride Product` ~ `Water Source`,nrow=2) + labs(title="Categorical Data counts by Fluoridation") + theme_minimal()




for (column in categorical_columns) {categorical_bar <- ggplot(data=fluoride_df) + 
  geom_bar(mapping=aes_string(x=column,fill="Fluoridated"),color="black",position="stack") + 
  scale_fill_manual(values=c("Yes"="grey","No"="maroon")) + 
  labs(title = paste("Counts of Fluoridated by", column), x = column, y = "Count")
  print(categorical_bar)}

#The amount of fluoridated PWS stay consistent throughout the 5 years 

#Ground water seems to be the most abundant form of water source, with majority PWS not being fluoridated, surface is marginally more noticeable in count that mixed and unknown but dwarfed by Ground count

#only natural for fluoride product has a noticeable amount of non-fluoridation with 









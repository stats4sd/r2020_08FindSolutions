Pulse2 <- read_csv("Pulse2.csv")

Pulse3 <-Pulse2%>%
  filter(Gender %in%c("Female", "Male") & Race!="DK/REF" & Education !="DK/REF" & PoliticalParty !="DK/REF" & PoliticalView !="DK/REF" &
           ApproveTrump !="DK/REF" & InformedClimateOpinion!= "DK/REF") %>%
  mutate(Race=recode(Race, 'DK/REF' = "Other", 'Other: SPECIFY' = "Other"),
         Education=recode(Education, 'DK/REF' = "Other", 'Other :SPECIFY' = "Other"),
         PoliticalParty =recode(PoliticalParty, 'Not Very strong Democrat'="Democrat", 'Not very Strong Republican'='Republican',
                                'Strong Democrat'='Democrat', 'Strong Republican'='Republican'),
         PoliticalView=recode(PoliticalView, 'Not Very Strong Conservative'='Conservative', 'Not Very Strong Liberal'='Liberal',
                              'Strong Conservative'='Conservative','Strong Liberal'='Liberal'),
         ApproveTrump=recode(ApproveTrump, 'Somewhat Approve'='Approve','Somewhat Disapprove'='Disapprove', 
                             'Strongly Approve'='Approve','Strongly Disapprove'='Disapprove'))

saveRDS(Pulse3, file = "Pulse2.RDS")
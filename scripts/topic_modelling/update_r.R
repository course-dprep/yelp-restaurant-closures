# Extract the R code from topic_modelling.Rmd into topic_modelling.R

knitr::purl(
	input  = "topic_modelling.Rmd",
	output = "topic_modelling.R",
	documentation = 0
)

message("topic_modelling.R updated from topic_modelling.Rmd")
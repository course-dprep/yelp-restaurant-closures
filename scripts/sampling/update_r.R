# Extract the R code from sampling.Rmd into sampling.R

knitr::purl(
	input  = "sampling.Rmd",
	output = "sampling.R",
	documentation = 0
)

message("Sampling.R updated from sampling.Rmd")
# load packages
required_packages <- c("tidyverse", "data.table", "here", "quanteda", "quanteda.textstats", "keyATM")

for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    suppressMessages(install.packages(pkg))
  }
}
#load all the dependencies
invisible(lapply(required_packages, function(pkg) {
  suppressPackageStartupMessages(library(pkg, character.only = TRUE))
}))

reviews <- read_csv(here("data", "training_data", "reviews_python_out.csv"))

#corpus
corp <- corpus(reviews, text_field = "text")
docvars(corp, "review_id") <- reviews$review_id

#tokenize
toks <- tokens(
  corp,
  remove_punct = TRUE,
  remove_numbers = TRUE,
  remove_symbols = TRUE,
  remove_url = TRUE) %>%
  tokens_tolower() %>%
  tokens_remove(stopwords("en")) %>%
  tokens_select (min_nchar = 2)		#this part cleans the reviews 

dfm_clean <- dfm(toks)
doc_len <- ntoken(dfm_clean)
sum(doc_len == 0) 

# Step 2: Word Frequency and Dictionary Creation


# Create a document-feature matrix for all tokens
dfmatrix <- dfm(toks)

# Computing the word frequencies for all tokens
word_freq <- textstat_frequency(dfmatrix)

# Check the 200 most frequent words excluding stopwords
head(word_freq, 200)

# Creating a dictionary with topics and most frequent, useful words

dict <- dictionary(list(
  food_quality = c("delicious", "flavor", "tasty"),
  cleanliness = c("fresh", "clean"),
  staff = c("friendly, staff, service, server, waitress, waiter, manager, attentive"),
  price = c("price"),
  waiting_time = c("wait")
  ))
  
  
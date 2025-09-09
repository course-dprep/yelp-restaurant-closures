required_packages <- c("tidyverse", "data.table", "here")

for (pkg in required_packages) {
	if (!requireNamespace(pkg, quietly = TRUE)) {
		suppressMessages(install.packages(pkg))
	}
}
#load all the dependencies
invisible(lapply(required_packages, function(pkg) {
	suppressPackageStartupMessages(library(pkg, character.only = TRUE))
}))

#loading data.tables into environment
review <- readRDS(here("data", "raw_data","review.rds"))
business <- readRDS(here("data", "raw_data","business.rds"))

#collect $business_id vector for all Restaurant businesses
restaurant_ids <- business[
  grepl("Restaurants", categories, fixed = TRUE), 
  unique(business_id)
]

#set index to speed up the data join
setindex(review, business_id)

#data join
review_restaurants <- review[.(restaurant_ids), on = "business_id", nomatch = 0L]

#check
uniqueN(review_restaurants$business_id)  # should return 52268

#stores data.table that includes business_id and corresponding number of reviews
review_counts <- review_restaurants[, .(n_reviews = .N), by = business_id]

restaurant_status <- business[.(restaurant_ids), on = "business_id", .(business_id, is_open)]


# merge counts with open/closed status
review_counts_status <- review_counts[
  business[, .(business_id, is_open)], 
  on = "business_id"
]

# how many restaurants are closed and have >= 50 reviews?
closed_50plus <- review_counts_status[n_reviews >= 50 & is_open == 0, .N]
closed_50plus   #no of restaurants that are closed but have 50+ reviews

date_cutoff <- "2018-01-01"

    #CLOSED RESTAURANTS

closed_ids <- restaurant_status[is_open == 0, unique(business_id)]  #closed restaurants id's

since2018_closed <- review_restaurants[
  business_id %chin% closed_ids & date >= as.IDate(date_cutoff),
  .N,
  by = business_id
]   #list of restaurants that are closed and their no. of reviews since 01 / 01 / 2018

since2018_closed[N >= 100, .N]  #no. of closed restaurants that have 100+ reviews since 2018 

closed_100plus_since18 <- since2018_closed[N >= 100, business_id] #business_id vector

    #OPEN RESTAURANTS

open_ids <- restaurant_status[is_open == 1, unique(business_id)]  ##open restaurants id's

since2018_open <- review_restaurants[
  business_id %chin% open_ids & date >= as.IDate(date_cutoff),
  .N,
  by = business_id
]   #list of restaurants that are open and their no. of reviews since 01 / 01 / 2018

since2018_open[N >= 100, .N]  #no. of open restaurants that have 100+ reviews since 2018 

open_100plus_since18 <- since2018_open[N >= 100, business_id] #business_id vector


set.seed(2310)    #setting seed for reproducibility

sampled_closed_ids <- sample(closed_100plus_since18, 50)  #sampled business id's for closed restaurants

sampled_open_ids <- sample(open_100plus_since18, 50)      #sampled business id's for open restaurants


sampled_ids <- c(sampled_closed_ids, sampled_open_ids)  #vector of all the sampled id's

review_restaurants[, date_id := as.IDate(date)] #creating date id (YYYY - MM - DD)

review_restaurants_since18 <- review_restaurants[date_id >= as.IDate(date_cutoff)] #filtering date

setindex(review_restaurants_since18, business_id) #improves speed 

set.seed(2310)  #set seed for reproducibility

reviews_sampled <- review_restaurants_since18[
  business_id %chin% sampled_ids,   #select only rows where business_id matches with samples_ids
  .SD[sample(.N, 50)],              #sample 50 out of total .N ->
  by = business_id                  #per business_id
]


# Ensure training_data directory
dir.create(here("data", "training_data"), recursive = TRUE, showWarnings = FALSE)

# Store the training data as .rds file
saveRDS(reviews_sampled, here("data","training_data","reviews_sampled.rds"))

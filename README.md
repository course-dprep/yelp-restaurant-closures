# A topic modeling study: The association between Yelp review sentiment and restaurant survival or closure
*Which aspects of the feedback provided by Yelp customer reviews are associated with restaurant closures?* 

## Motivation

Online customer reviews play a significant role in shaping how restaurants are perceived by consumers. When searching for new places to eat at, consumers may resort to customer review platforms, such as Yelp, to assess which would be worth giving a try. Therefore, the valence of a restaurant's reviews on several different aspects can impact its success, and ultimately, its survival. Restaurant closures are the endmost sign that a restaurant was unsuccessful as a business, which can occur for several reasons. The aim of this project is then to explore which, if any, aspects of customer reviews are associated to restaurant closures. To do so, a sample of Yelp's restaurant reviews will be used.

Investigating the research question *Which aspects of the feedback provided by Yelp customer reviews are associated with restaurant closures?* is crucial, as the insights derived from it may help current and prospective restaurant owners in detecting potential threats to their establishments' survival. That is, restaurant owners can use our results to, for example, be able to ascertain when the restaurants' survival might be at risk, establish which key areas warrant improvement to exceed customer expectations, and adjust their business strategies to address early signs of threats before they escalate into critical issues.

## Data

The dataset used was Yelp Open Dataset, a public dataset provided by the review platform "Yelp". This dataset was obtained via the following link: [Yelp Open Dataset] (https://business.yelp.com/data/resources/open-dataset/). 

The dataset contains holds millions of reviews on a variety of types of establishments, services, and experiences, which lay outside the scope of our project. To properly study our research question, we then narrowed down the dataset to a random sample of 5000 restaurant reviews. In the case of those restaurants that did close, only reviews written prior to their closure dates were included in the final sample. In other words, no reviews written after a restaurant's closure date are included in the final sample.

**- Include a table of variable description/operstionalisation.**

## Method

To answer our research question, which is of exploratory nature, we first conducted a sentiment analysis on the 5000- reviews sample. This allowed us to classify the reviews as being of positive or negative nature. We then used topic modeling to identify relevant aspects of positive vs. negative reviews. Lastly, we checked which of, and whether, these aspects are associated to restarant closures.

**- Provide justification for why it is the most suitable.** 

## Preview of Findings 
- Describe the gist of your findings (save the details for the final paper!)
- How are the findings/end product of the project deployed?
- Explain the relevance of these findings/product. 

## Repository Overview 

**Include a tree diagram that illustrates the repository structure*

## Dependencies 

*Explain any tools or packages that need to be installed to run this workflow.*

## Running Instructions 

*Provide step-by-step instructions that have to be followed to run this workflow.*

## About 

This repository was made by Geert Huissen, Alice Ruggiero, Mathijs Quarles van Ufford, Nigel de Jong, and Maria Orgaz Jimenez as part of the Master's course [Data Preparation & Programming Skills](https://dprep.hannesdatta.com/) at the [Department of Marketing](https://www.tilburguniversity.edu/about/schools/economics-and-management/organization/departments/marketing), [Tilburg University](https://www.tilburguniversity.edu/), the Netherlands.

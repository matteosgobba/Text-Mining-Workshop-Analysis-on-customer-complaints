# Intro
This project was done in December 2024 in the penultimate semester of my bachelor's degree, during a 3-week workshop for the course "Business Data Analytics". The goal of the project was to analyze the corpus of complaints for different financial services and products, and try to gain insights and extract useful information using text mining techniques in R.

The dataset used was the 2022 Consumer Complaint Database of the CFPB (Consumer Financial Protection Bureau); you can download the data at the following [link](https://www.consumerfinance.gov/data-research/consumer-complaints/).
# Project structure
- **Data Sampling:** A 5% random sample of the unigrams dataset is selected to ensure computational efficiency.
- **Preprocessing:**
  - Removal of stopwords and non-informative tokens.
  - Lemmatization of words.
  - Filtering out numeric characters.
- **Frequency Analysis:** Identification and visualization of the most frequent tokens.
- **Company Analysis:**
  - Focus on the six companies with the highest number of complaints.
  - Calculation of TF-IDF scores to detect distinctive words for each company.
- **Co-Word Analysis:**
  - Construction of bipartite networks between complaints and tokens.
  - Projection to build a co-occurrence network, highlighting strong connections.
  - Community detection using the Louvain algorithm.
- **Cosine Similarity:**
  - Evaluation of semantic similarity between company complaint profiles.
# Technologies
R, Gephi.

Libraries: `tidyverse`, `tidytext`, `textstem`, `igraph`, `ggraph`, `lsa`, `tm`, `SnowballC`

# Installation
To install the required R packages, run:

<pre>install.packages(c("tidyverse", "tidytext", "textstem", "igraph", "ggraph", "lsa", "tm", "SnowballC"))</pre>

or, RStudio will prompt an installation message automatically when trying to run the code.


Some packages might need additional dependencies.

Make sure to update R and RStudio to the latest versions if you encounter installation issues.

# Files

- ```dataset.csv:``` Original complaints dataset.
- ```df_unigrams.csv:``` Tokenized unigrams dataset.
- R scripts: Full analysis pipeline.
- (Optional) ```.gml``` files for Gephi visualization export.

# Running
- Set the correct working directory.
- Load the necessary libraries.
- Run the script step by step following the logical workflow.
- Adjust sampling size, stopwords, or visualization parameters as needed.

**NOTE:** The project is designed for exploratory purposes and can be adapted for further, more formal modeling tasks.

# Visualizations
- Bar plots of token frequencies.
- TF-IDF bar charts per company.
- Co-word / cosine similarity networks with community detection using [Gephi](https://gephi.org/).
- Cosine similarity matrices.

# Credits

@matteosgobba, @FedericaMonte, @GiorgiaDeMario, @GalatàSerena, @SummoEmanuela, @RendineFrancesca, @SchinoPasquale, @BellomoMichele


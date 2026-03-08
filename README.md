![alt text](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
![alt text](https://img.shields.io/badge/Gephi-%23000000.svg?style=for-the-badge)
![alt text](https://img.shields.io/badge/Data_Analytics-Business_Insights-success?style=for-the-badge)

## 📌 Overview
This project was developed during a 3-week workshop for the **Business Data Analytics** course (Bachelor's Degree). The objective of the analysis is to answer a core business question:

> *"How can text mining transform customer complaints into opportunities for business improvement?"*

By analyzing a massive corpus of complaints regarding financial services and products, we applied various text mining techniques in **R** and **Gephi** to extract hidden patterns, identify critical issues, and provide actionable business recommendations.

The dataset used is the **2022 Consumer Complaint Database** published by the CFPB (Consumer Financial Protection Bureau). You can explore the raw data [here](https://www.consumerfinance.gov/data-research/consumer-complaints/).

## 🔬 Methodology & Project Workflow

The analysis follows a structured 6-step pipeline:

1. **Data Preparation & Cleaning:** 
   - Reduced the dataset to a **5% representative sample** for computational efficiency.
   - Applied **Regular Expressions (RegEx)** to remove numeric characters and masked data (e.g., "xxxx").
   - Removed stopwords and performed **lemmatization** to reduce words to their base form.
2. **Targeted Sampling:** 
   - Focused the analysis on the **top 6 companies** with the highest volume of complaints (representing ~61% of the dataset): *TransUnion, Equifax, Experian, JPMorgan Chase, Bank of America,* and *Capital One*.
3. **Global Frequency Analysis:** 
   - Identified the most recurrent themes, highlighting a predominance of issues related to credit reports, accounts, and disputes.
4. **TF-IDF Analysis:** 
   - Extracted distinctive keywords for each company to differentiate their core operational issues.
5. **Co-Word Analysis:** 
   - Built bipartite networks and projected co-occurrence graphs. 
   - Applied the **Louvain algorithm** for community detection to find deeper correlations between regulatory terms and privacy violations.
6. **Cosine Similarity:** 
   - Evaluated the semantic similarity between complaint profiles, normalizing data to map out distinct thematic clusters (e.g., *Legal/Regulatory*, *Privacy/Data Protection*).
  
## 💡 Key Business Insights

Through our analysis, we uncovered distinct differences in complaint profiles:
* **Traditional Banks** (*Bank of America, JPMorgan Chase*): Complaints heavily focus on operational and service problems typical of retail banking (deposits, transactions, checks, fraud).
* **Credit Agencies** (*Equifax, Experian, TransUnion*): Complaints are strictly tied to credit reports, with frequent references to regulatory violations and privacy concerns.
* **Hybrid** (*Capital One*): Sits in the middle, with a strong emphasis on credit card and payment issues.

### Recommended Interventions
Based on the text mining results, we propose the following corporate strategies:
1. **Improve Data Management:** Introduce safer, more efficient systems to optimize the correction and deletion processes on credit reports.
2. **Ensure Regulatory Compliance:** Invest in internal audits and update personal data processing policies to avoid legal disputes.
3. **Strengthen Security & Anti-Fraud:** Particularly for traditional banks, upgrade infrastructure for crediting procedures and money transfers to prevent identity theft.
4. **Optimize Customer Service:** Provide faster, targeted responses to customers requiring specific, repetitive actions (e.g., account deletion, dispute resolution).

## 🚀 How to run

1. Clone the Repository
Download or clone this repository to your local machine:
```bash
git clone https://github.com/matteosgobba/Text-Mining-Workshop-Analysis-on-customer-complaints.git
```
2. Prepare the Data

Ensure that `dataset.csv` and `df_unigrams.csv` are located in the same root folder as your R script. _(Note: If `dataset.csv` is too large for GitHub, you may need to download the raw data from the CFPB website)._

3. Install R packages

To install the required R packages, run:

```R
install.packages(c("tidyverse", "tidytext", "textstem", "igraph", "ggraph", "lsa", "tm", "SnowballC"))</pre>
```

or, RStudio will prompt an installation message automatically when trying to run the code.

Some packages might need additional dependencies.

Make sure to update R and RStudio to the latest versions if you encounter installation issues.

4. Update the Working Directory

Open the R script in RStudio. You must update the `setwd()` function at the top of the script to match the path on your local machine where the repository is saved:

Change this line:

```bash
setwd("D:\\Documenti\\Università\\Business Data Analytics\\Workshop")
```

To your actual local path, for example:

```bash
setwd("C:/Users/YourName/Documents/Text-Mining-Workshop")
```

5. Execute the R script

Run the script step-by-step or all at once. The code is divided into logical blocks:

- **Lines 1-45:** Data loading, cleaning, and Global Frequency visualization.
- **Lines 48-93:** Co-Word Analysis, Bipartite Network projection, and Louvain community detection.
- **Lines 95-115:** Cosine Similarity matrix and clustering.

6. Visualize in Gephi (Optional)

Running the Co-Word analysis block will automatically generate and save a `.gml` in your working directory.

- Open [Gephi](https://gephi.org/).
- Go to File > Open and select the .gml file.
- Apply a layout algorithm (e.g., Yifan Hu Proportional or Fruchterman Reingold).
- Adjust node sizes based on degree/strength and color them by community to recreate the network visualizations shown above.

# Files

- ```dataset.csv:``` Original complaints dataset.
- ```df_unigrams.csv:``` Tokenized unigrams dataset.
- R scripts: Full analysis pipeline.
- (Optional) ```.gml``` files for Gephi visualization export.

_Note: The project is designed for exploratory purposes and can be adapted for further, more formal modeling tasks._

# 🕸️ Visualizations
- Bar plots of token frequencies.
- TF-IDF bar charts per company.
- Co-word / cosine similarity networks with community detection using [Gephi](https://gephi.org/).
- Cosine similarity matrices.

These are 2 graphs obtained by using our exported ```.gml``` code in Gephi (co-word and cosine similarity networks):
<p align="center">
  <img src="https://raw.githubusercontent.com/matteosgobba/Text-Mining-Workshop-Analysis-on-customer-complaints/refs/heads/main/screenshots/coword_graph.png" width="500"/>
  <img src="https://raw.githubusercontent.com/matteosgobba/Text-Mining-Workshop-Analysis-on-customer-complaints/refs/heads/main/screenshots/cosine_similarity.png" width="500"/>
</p>

# Credits

@matteosgobba, @FedericaMonte, @GiorgiaDeMario, @GalatàSerena, @SummoEmanuela, @RendineFrancesca, @SchinoPasquale, @BellomoMichele


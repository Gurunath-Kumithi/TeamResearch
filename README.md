📘 Team Research Project
Comparison of Early vs Late 2021 COVID-19 Vaccination Rates in U.S. States

University of Hertfordshire – 7COM1079 Team Research & Development Project
Group A209 – Dataset DS317

📖 Project Overview

This project analyses COVID-19 vaccination activity across all U.S. states during 2021, comparing Early 2021 (Jan–Jun) with Late 2021 (Jul–Dec).
The goal is to determine whether a statistically significant difference existed in the number of daily vaccinations administered between the two phases.

The analysis uses real-world data sourced from Our World in Data, processed and analysed in R.

The final output includes:

Data cleaning and preprocessing

Visualisations (histograms, boxplots)

Descriptive statistics

Hypothesis testing (t-test & Wilcoxon rank-sum)

A complete written report (Report.docx)

🧠 Research Question

Do U.S. states administer significantly more daily COVID-19 vaccinations in early 2021 compared with late 2021?

📂 Repository Contents
File	Description
Analysis.R	R script containing full data cleaning, visualisation, and statistical testing
us_state_vaccinations.csv	Raw dataset used in the project
Report.docx	Full academic report with results, evaluation, and references
README.md	Project overview and instructions
🔧 How to Run the Analysis
1. Requirements

You will need:

R version ≥ 4.0

Required R packages:

install.packages("readr")

2. Running the Script

Clone the repository:

git clone https://github.com/Gurunath-Kumithi/TeamResearch.git
cd TeamResearch


Open Analysis.R in RStudio or run:

source("Analysis.R")


The script will:

Import and clean the dataset

Create the Early2021 / Late2021 grouping

Produce histograms and boxplots

Run t-test and Wilcoxon rank-sum tests

Print descriptive statistics

📊 Summary of Findings

Early 2021 had substantially higher daily vaccination rates than late 2021.

Data were right-skewed, so the Wilcoxon rank-sum test was used.

Result:

W = 89,351,556

p < 2.2e-16 (highly significant)

Median early 2021: 4963

Median late 2021: 2455

Conclusion: Vaccination intensity decreased significantly from early to late 2021.

These results align with the national trend of strong early rollout followed by declining demand.

🛠️ Project Structure & Workflow

The project followed a collaborative workflow using:

RStudio for analysis

GitHub for version control

Regular commits documenting progress (shown in Appendix B of the report)

Key development milestones included:

Data import & cleaning

Creation of 2021 period categories

Statistical summaries

Visualisations

Hypothesis testing

Final report writing

👥 Group Members (Group A209)

Gurunath Kumithi – 24161025

Shalini Solium – 24152576

Sravani Mandalam – 25006236

Kusuma Ummadipoli – 24177473

Arafath Shaik – 24158234

📘 Full Report

For detailed analysis, results, discussion, evaluation, and references, see:
📄 Report.docx

📚 References

This project uses publicly available U.S. COVID-19 vaccination data from Our World in Data and references recent peer-reviewed research (full bibliography included in Report.docx).

🏁 License

This project is for academic use only (University of Hertfordshire coursework).

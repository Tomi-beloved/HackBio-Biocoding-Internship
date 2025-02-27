# Task Code 2.1: Microbiology
---
Look at this dataset here.
This is the description of the dataset . [open in a new tab, not a file to be downloaded]
Plot all the growth curves of OD600 vs Time for the different Strains with the following instructions
For each strain, plot a growth curve of the the knock out (-) an knock in (+) strain overlaid on top of each other
Using your function from last stage, determine the time to reach the carrying capacity for each strain/mutant
Generate a scatter plot of the time it takes to reach carrying capacity for the knock out and the knock in strains
Generate a box plot of the time it takes to reach carrying capacity for the knock out and the knock in strains
Is there a statistical difference in the time it takes the knock out strains to reach their maximum carrying capacity compared to the knock in strains
What do you see? Explain your observations as comments in your code

---

# Task Code 2.4: Biochemistry & Oncology
---
Proteins structures are known to be strongly connected to their functions. However, at the amino acid level, not all amino acids contribute to structure and function equally. Galardini and colleagues decided to investigate the impact of all possible individual, non synonymous nonsense mutations on the structure and function of protein.
The functional impact was computed as SIFT scores and the structural impact was calculated as FoldX Score (in kCal/mol).
Dataset Here:
**SIFT Dataset**
**FoldX Dataset**
**Task**

Import both sift and foldx datasets; in both datasets, create a column specific_Protein_aa which will be a cantenation of the Protein and Amino_acid columns such that If you have Protein A5A607 and Amino_acid E63D, you have specific_Protein_aa A5A607_E63D
Using the specific_Protein_aa column, merge sift and foldx dataset into one final dataframe.
According to the authors;
A SIFT Score below 0.05 is deleterious
A FoldX score greater than 2 kCal/mol is deleterious
Using the criteria above, Find all mutations that have a SIFT score below 0.05 and FoldX Score above 2 (i.e: Mutations that affect both structure and function)
Study the amino acid substitution nomenclature
Investigate for the amino acid that has the most functional and structural impact
Hint: Using the amino acid column, find a way to select the first amino acid. Solution here
Generate a frequency table for all the amino acids
Using the amino frequency table above, generate a barplot and pie chart to represent the frequency of the amino acids.
Briefly describe the amino acid with the highest impact on protein structure and function
What can you say about the structural property and functional property of amino acids with more than 100 occurences.

---

# Task Code 2.6: Transcriptomics
---
This is a processed RNAseq dataset involving reading in quantitated gene expression data from an RNA-seq experiment, exploring the data using base R functions and then interpretation. The dataset contains an experiment between a diseased cell line and diseased cell lines treated with compound X. The difference in expression change between the two health status is computed as Fold change to log 2 (Log2FC) and the significance of each is computed in p-value.
Access Dataset Here
**Task**:
Generate a volcano plot. (Hint search for volcano plot online)
Determine the upregulated genes (Genes with Log2FC > 1 and pvalue < 0.01)
Determine the upregulated genes (Genes with Log2FC < -1 and pvalue < 0.01)
What are the functions of the top 5 upregulated genes and top 5 downregulated genes. (Use genecards)

---

# Task Code 2.7: Public Health
---
NHANES is a program run by the CDC to assess the health and nutritional status of adults and children in the US. It combines survey questions and physical examinations, including medical and physiological measurements and laboratory tests, and examines a representative sample of about 5,000 people each year. The data is used to determine the prevalence of diseases and risk factors, establish national standards, and support epidemiology studies and health sciences research. This information helps to develop public health policy, design health programs and services, and expand the nation's health knowledge.
Dataset here [https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/nhanes.csv]
Data Dictionary [https://github.com/Anifowak/HackBio-Biocoding-Internship/blob/main/Stage%202/nhanes_dd.csv]
**Tasks**:
Process all NA (either by deleting or by converting to zero)
Visualize the distribution of BMI, Weight, Weight in pounds (weight *2.2) and Age with an histogram.
What’s the mean 60-second pulse rate for all participants in the data?
What’s the range of values for diastolic blood pressure in all participants? (Hint: see help for min(), max()).
What’s the variance and standard deviation for income among all participants?
Visualize the relationship between weight and height ?
Color the points by
gender
diabetes
smoking status
Conduct t-test between the following variables and make conclusions on the relationship between them based on P-Value
Age and Gender
BMI and Diabetes
Alcohol Year and Relationship Status

# Load necessary libraries
library(ggplot2)
# Load data
data <- read.table("https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt", header = TRUE, sep = " ")

# Generate volcano plot
ggplot(data, aes(x = log2FoldChange, y = -log10(pvalue))) +
                geom_point(alpha = 0.4) +
                theme_minimal() +
                xlab("Log2 Fold Change") +
                ylab("-Log10 p-value") +
                ggtitle("Volcano Plot")


data <- read.table("https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt", header = TRUE, sep = " ")
# Generate volcano plot using plot()
plot(data$log2FoldChange, -log10(data$pvalue),
     xlab = "Log2 Fold Change",
     ylab = "-Log10 p-value",
     main = "Volcano Plot",
     pch = 20, # point shape
     col = ifelse(data$log2FoldChange > 1 & data$pvalue < 0.01, "red",
                  ifelse(data$log2FoldChange < -1 & data$pvalue < 0.01, "blue", "black")))

# Upregulated genes
upregulated_genes <- subset(data, log2FoldChange > 1 & pvalue < 0.01)
print(upregulated_genes)

# Downregulated genes
downregulated_genes <- subset(data, log2FoldChange < -1 & pvalue < 0.01)
print(downregulated_genes)

# Top 5 upregulated genes
top5_upregulated <- head(upregulated_genes[order(-upregulated_genes$log2FoldChange), ], 5)
print(top5_upregulated)

# Top 5 downregulated genes
top5_downregulated <- head(downregulated_genes[order(downregulated_genes$log2FoldChange), ], 5)
print(top5_downregulated)

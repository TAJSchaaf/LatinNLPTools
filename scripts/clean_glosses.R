# Install pacman if not installed
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")

# Load required packages
pacman::p_load(
  "readr", "stringr", "dplyr"
)

# data import
glosses = read.csv("/Users/Thea/Desktop/LatinNLPTools/data/glosses.csv", header=TRUE)

head(glosses)

# Select only the glossID and Gloss columns
glosses_cleaned <- glosses %>%
  select(GlossID, Gloss) %>%
  # Replace '.i.' with 'idest' in Gloss
  mutate(Gloss = str_replace_all(Gloss, "\\.i\\.", "idest")) %>%
  # Remove all punctuation from Gloss
  mutate(Gloss = str_remove_all(Gloss, "[[:punct:]]"))

head(glosses_cleaned)

# Write the cleaned data to a new CSV file
write_csv(glosses_cleaned, "/Users/Thea/Desktop/LatinNLPTools/data/glosses_cleaned.csv")

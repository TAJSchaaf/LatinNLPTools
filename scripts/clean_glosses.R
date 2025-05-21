# Install pacman if not installed
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")

# Load required packages
pacman::p_load(
  "readr", "stringr", "dplyr"
)

# data import
glosses = read.csv("/Users/Thea/Desktop/LatinNLPTools/data/gold_standard_original/original_glosses.csv", header=TRUE)

head(glosses)

# Select only the sample_id, word, and lemma columns
glosses_cleaned <- glosses %>%
  select(sample_id, word, lemma, pos) %>%
  # Replace '.i.' with 'idest' in word and lemma
  mutate(word = str_replace_all(word, "\\.i\\.", "idest")) %>%
  mutate(word = str_replace_all(word, "i\\.", "idest")) %>%
  mutate(lemma = str_replace_all(lemma, "\\.i\\.", "idest")) %>%
  mutate(lemma = str_replace_all(lemma, "i\\.", "idest")) %>%
  # Replace '???' with '?' in word and lemma
  mutate(word = str_replace_all(word, fixed("???"), "?")) %>%
  mutate(lemma = str_replace_all(lemma, fixed("???"), "?"))

head(glosses_cleaned)

# Write the cleaned data to a new CSV file
write_csv(glosses_cleaned, "/Users/Thea/Desktop/LatinNLPTools/data/gold_standard/gs_glosses.csv")

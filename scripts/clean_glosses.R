# Install pacman if not installed
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")

# Load required packages
pacman::p_load(
  "readr", "stringr", "dplyr", "tidyr"
)

# data import
glosses = read.csv("/Users/Thea/Desktop/LatinNLPTools/data/gold_standard_original/original_glosses.csv", header=TRUE)

head(glosses)

# Select only the sample_id, word, and lemma columns
glosses_cleaned <- glosses %>%
  select(sample_id, word_id, word, lemma, pos) %>%
  mutate(
    
    # Convert word and lemma values to lowercase
    word = tolower(word),
    lemma = tolower(lemma),
    
    # Replace .i. and .i with idest
    word = str_replace_all(word, "\\.i\\.", "idest"),
    word = str_replace_all(word, "i\\.", "idest"),
    lemma = str_replace_all(lemma, "\\.i\\.", "idest"),
    lemma = str_replace_all(lemma, "i\\.", "idest"),
    
    # Replace empty strings in pos with NA
    pos = ifelse(is.na(pos) | pos == "", "NA", pos),
    
    # Replace ??? with ?
    word = str_replace_all(word, fixed("???"), "?"),
    lemma = str_replace_all(lemma, fixed("???"), "?")
    
  )

head(glosses_cleaned)

# Write the cleaned data to a new CSV file
write_csv(glosses_cleaned, "/Users/Thea/Desktop/LatinNLPTools/data/gold_standard/gs_glosses.csv")

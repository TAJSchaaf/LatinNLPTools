# script to convert conllu-converted csv files for use as sample data in NLPLatin model tests
# purpose: preserves relevant attributes and renames them for standard testing
# produces: a .csv file with the variables sample_id, word_id, word, lemma, pos

# Install pacman if not installed
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")

# Load required packages
pacman::p_load(
  "readr", "stringr", "dplyr"
)

# data import select .csv
data = read.csv("/Users/Thea/Desktop/LatinNLPTools/data/gold_standard/late-latin-charters.csv", header=TRUE)

head(data)

data_cleaned <- data %>%
  select(SENT_NO, ID, FORM, LEMMA, UPOS) %>%
  rename(sample_id = SENT_NO)%>%
  rename(word_id = ID)%>%
  rename(word = FORM)%>%
  rename(lemma = LEMMA)%>%
  rename(pos = UPOS)
  
head(data_cleaned)

# Write the cleaned data to a new CSV file
write_csv(data_cleaned, "/Users/Thea/Desktop/LatinNLPTools/data/gold_standard/gs_medieval_charters.csv")  

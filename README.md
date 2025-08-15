# Latin NLP Tools Comparison

This project evaluates the **speed**, **accuracy**, and **usability** of four prominent Natural Language Processing (NLP) tools for **Latin texts**:

- [CLTK (Classical Language Toolkit)](https://cltk.org/)
- [Stanza for Latin (Stanford NLP)](https://stanfordnlp.github.io/stanza/)
- [UDPipe](https://ufal.mff.cuni.cz/udpipe)
- [TreeTagger](https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/)

Two samples are used for testing:
- [Early medieval glosses from the Vienna Bede](https://gams.uni-graz.at/context:glossvibe)
- [Early medieval texts from the Late Latin Charter Treebank](https://github.com/UniversalDependencies/UD_Latin-LLCT/blob/master/la_llct-ud-dev.conllu)
  
## Project Goal

To provide a reproducible and comparative analysis of Latin NLP tools for tokenisation, lemmatisation, and POS-tagging, as well as processing speed. 

## Project Structure

- `data/`: Sample Latin texts (raw and preprocessed)
- `notebooks/`: Jupyter notebooks for experiments
- `scripts/`: Python scripts for preprocessing and tool execution
- `results/`: Accuracy/speed metrics and visualizations

## Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/latin-nlp-comparison.git
   cd latin-nlp-comparison ```
2. Create a virtual environment:
   ```python3 -m venv env
    source env/bin/activate ```
3. Install dependencies:

```pip install -r requirements.txt ```
  
## Metrics Evaluated
- Accuracy
  - Tokenisation
  - Lemmatisation
  - POS
- Speed: length of time to process data
- Usability: Observational assessment of set-up complexity, packages required, interface, export options
## Wiki

See the [GitHub Wiki](https://github.com/TAJSchaaf/LatinNLPTools/wiki) for documentation, tool setup guides, and detailed findings.

## Acknowledgments

Supervised by Bernhard Bauer at the University of Graz.

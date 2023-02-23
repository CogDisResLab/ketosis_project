library (tidyverse)
library (org.Hs.eg.db)
library (readxl)
library (writexl)


#Change SCZ GeneIDs to Gene Symbols in Fast vs. SZCP file
dge <- read_excel("Datasets for KS Input/Smita Microarray Processed DEGs for KS Input.xlsx", sheet = "SZCP vs. CTL") %>%
  mutate(ID = as.character(ID))
gns <-select(org.Hs.eg.db, as.character(dge$ID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("ID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_excel(dge, "Smita Microarray Processed DEGs for KS Input.xlsx", sheet_name = "SETD1A_Knockdown vs. CTL_GeneName")

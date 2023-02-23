library (tidyverse)
library(org.Hs.eg.db)

#Change BPD GeneIDs to Gene Symbols in DGE for GSE159487 Comparison 1
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE159487-[Deficient_LEF1_Expression_in_Lithium_Non-Responsive_BPD_Subjects_vs._CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
write_csv("BPD_DGEs_with_Gene_Names/GSE159487-[Deficient_LEF1_Expression_in_Lithium_Non-Responsive_BPD_Subjects_vs._CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE159487 Comparison 2
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE159487-[Deficient_LEF1_Expression_in_Lithium_Responsive_BPD_Subjects_vs._CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE159487-[Deficient_LEF1_Expression_in_Lithium_Responsive_BPD_Subjects_vs._CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE179921 Comparison 1
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE179921-[TCF7L2_KD_in_human_iPSC-derived_astrocytes_vs._CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE179921-[TCF7L2_KD_in_human_iPSC-derived_astrocytes_vs._CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE179921 Comparison 2
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE179921-[TCF7L2_lncRNA_KD_in_human_iPSC-derived_astrocytes_vs._CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE179921-[TCF7L2_lncRNA_KD_in_human_iPSC-derived_astrocytes_vs._CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE134497
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE134497-[Cerebral_Organoids_BPD_vs_CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE134497-[Cerebral_Organoids_BPD_vs_CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE133357
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE133357-[Regional_Microglia_Expression_in_BPD_vs._Multisystem_Atrophy_Subjects].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE133357-[Regional_Microglia_Expression_in_BPD_vs._Multisystem_Atrophy_Subjects].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE81396 Comparison 1
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE81396-[Nucleus_BPD_vs_CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE81396-[Nucleus_BPD_vs_CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE81396 Comparison 2
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE81396-[Putamen_BPD_vs_CTRL].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE81396-[Putamen_BPD_vs_CTRL].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE77131
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE77131-[Scalp_vs_Dura_derived_culture_fibroblasts_in_11_postmortem_donors_w_various_disease_states].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE77131-[Scalp_vs_Dura_derived_culture_fibroblasts_in_11_postmortem_donors_w_various_disease_states].csv")


#Change BPD GeneIDs to Gene Symbols in DGE for GSE53239
dge <- read.csv("Galaxy_Output_BPD_DGEs/GSE53239-[Brain_transcriptome_in_postmortem_DLPFC_tissue_in_BPD_vs_CTRL_subjects].csv") %>%
  mutate(GeneID = as.character(GeneID))
gns <-select(org.Hs.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")
dge <- dge %>%
  inner_join(gns, by = c("GeneID"="ENTREZID")) %>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("BPD_DGEs_with_Gene_Names/GSE53239-[Brain_transcriptome_in_postmortem_DLPFC_tissue_in_BPD_vs_CTRL_subjects].csv")

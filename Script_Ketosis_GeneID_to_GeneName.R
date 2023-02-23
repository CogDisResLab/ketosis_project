library(tidyverse)
library(Orthology.eg.db)
library(org.Mm.eg.db)
library(org.Hs.eg.db)

#Change SCZ GeneIDs to Gene Symbols in DGE for KDvsSD_Astrocytes_Duking matrix
dge <- read.csv("Galaxy_Output_Ketosis_DEGs/KDvsSD_Astrocytes_Duking.csv") %>%
  mutate(GeneID = as.character(GeneID))

gns <- select(org.Mm.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")

mapped <- select(Orthology.eg.db, gns$ENTREZID, "Homo_sapiens","Mus_musculus") %>%
  filter(!is.na(Homo_sapiens)) %>%
  mutate(Homo_sapiens = as.character(Homo_sapiens))

human_genes <- mapIds(org.Hs.eg.db, mapped$Homo_sapiens, "SYMBOL", "ENTREZID") %>%
  enframe(name = "ENTREZID", value = "SYMBOL")

mapped_mouse <- mapped |>
  inner_join(human_genes, by = c("Homo_sapiens" = "ENTREZID"))

dge <- dge %>%
  inner_join(mapped_mouse, by = c("GeneID"="Mus_musculus"))%>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("Ketosis_DEGs_with_Gene_Names/KDvsSD_Astrocytes_Duking.csv")


#Change SCZ GeneIDs to Gene Symbols in DGE for KDvsSD_Oligo_Duking matrix
dge <- read.csv("Galaxy_Output_Ketosis_DEGs/KDvsSD_Oligo_Duking.csv") %>%
  mutate(GeneID = as.character(GeneID))

gns <- select(org.Mm.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")

mapped <- select(Orthology.eg.db, gns$ENTREZID, "Homo_sapiens","Mus_musculus") %>%
  filter(!is.na(Homo_sapiens)) %>%
  mutate(Homo_sapiens = as.character(Homo_sapiens))

human_genes <- mapIds(org.Hs.eg.db, mapped$Homo_sapiens, "SYMBOL", "ENTREZID") %>%
  enframe(name = "ENTREZID", value = "SYMBOL")

mapped_mouse <- mapped |>
  inner_join(human_genes, by = c("Homo_sapiens" = "ENTREZID"))

dge <- dge %>%
  inner_join(mapped_mouse, by = c("GeneID"="Mus_musculus"))%>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("Ketosis_DEGs_with_Gene_Names/KDvsSD_Oligo_Duking.csv")


#Change SCZ GeneIDs to Gene Symbols in DGE for Kidney HFD vs CTRL matrix
dge <- read.csv("Galaxy_Output_Ketosis_DEGs/Kidney HFD vs CTRL.csv") %>%
  mutate(GeneID = as.character(GeneID))

gns <- select(org.Mm.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")

mapped <- select(Orthology.eg.db, gns$ENTREZID, "Homo_sapiens","Mus_musculus") %>%
  filter(!is.na(Homo_sapiens)) %>%
  mutate(Homo_sapiens = as.character(Homo_sapiens))

human_genes <- mapIds(org.Hs.eg.db, mapped$Homo_sapiens, "SYMBOL", "ENTREZID") %>%
  enframe(name = "ENTREZID", value = "SYMBOL")

mapped_mouse <- mapped |>
  inner_join(human_genes, by = c("Homo_sapiens" = "ENTREZID"))

dge <- dge %>%
  inner_join(mapped_mouse, by = c("GeneID"="Mus_musculus"))%>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("Ketosis_DEGs_with_Gene_Names/Kidney HFD vs CTRL.csv")


#Change SCZ GeneIDs to Gene Symbols in DGE for Kidney KD vs CTRL matrix
dge <- read.csv("Galaxy_Output_Ketosis_DEGs/Kidney KD vs CTRL.csv") %>%
  mutate(GeneID = as.character(GeneID))

gns <- select(org.Mm.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")

mapped <- select(Orthology.eg.db, gns$ENTREZID, "Homo_sapiens","Mus_musculus") %>%
  filter(!is.na(Homo_sapiens)) %>%
  mutate(Homo_sapiens = as.character(Homo_sapiens))

human_genes <- mapIds(org.Hs.eg.db, mapped$Homo_sapiens, "SYMBOL", "ENTREZID") %>%
  enframe(name = "ENTREZID", value = "SYMBOL")

mapped_mouse <- mapped |>
  inner_join(human_genes, by = c("Homo_sapiens" = "ENTREZID"))

dge <- dge %>%
  inner_join(mapped_mouse, by = c("GeneID"="Mus_musculus"))%>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("Ketosis_DEGs_with_Gene_Names/Kidney KD vs CTRL.csv")


#Change SCZ GeneIDs to Gene Symbols in DGE for Liver HFD vs CTRL matrix
dge <- read.csv("Galaxy_Output_Ketosis_DEGs/Liver HFD vs CTRL.csv") %>%
  mutate(GeneID = as.character(GeneID))

gns <- select(org.Mm.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")

mapped <- select(Orthology.eg.db, gns$ENTREZID, "Homo_sapiens","Mus_musculus") %>%
  filter(!is.na(Homo_sapiens)) %>%
  mutate(Homo_sapiens = as.character(Homo_sapiens))

human_genes <- mapIds(org.Hs.eg.db, mapped$Homo_sapiens, "SYMBOL", "ENTREZID") %>%
  enframe(name = "ENTREZID", value = "SYMBOL")

mapped_mouse <- mapped |>
  inner_join(human_genes, by = c("Homo_sapiens" = "ENTREZID"))

dge <- dge %>%
  inner_join(mapped_mouse, by = c("GeneID"="Mus_musculus"))%>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("Ketosis_DEGs_with_Gene_Names/Liver HFD vs CTRL.csv")


#Change SCZ GeneIDs to Gene Symbols in DGE for Liver KD vs CTRL matrix
dge <- read.csv("Galaxy_Output_Ketosis_DEGs/Liver KD vs CTRL.csv") %>%
  mutate(GeneID = as.character(GeneID))

gns <- select(org.Mm.eg.db, as.character(dge$GeneID), c("ENTREZID","SYMBOL"),"ENTREZID")

mapped <- select(Orthology.eg.db, gns$ENTREZID, "Homo_sapiens","Mus_musculus") %>%
  filter(!is.na(Homo_sapiens)) %>%
  mutate(Homo_sapiens = as.character(Homo_sapiens))

human_genes <- mapIds(org.Hs.eg.db, mapped$Homo_sapiens, "SYMBOL", "ENTREZID") %>%
  enframe(name = "ENTREZID", value = "SYMBOL")

mapped_mouse <- mapped |>
  inner_join(human_genes, by = c("Homo_sapiens" = "ENTREZID"))

dge <- dge %>%
  inner_join(mapped_mouse, by = c("GeneID"="Mus_musculus"))%>%
  filter(!is.na(SYMBOL)) %>%
  write_csv("Ketosis_DEGs_with_Gene_Names/Liver KD vs CTRL.csv")

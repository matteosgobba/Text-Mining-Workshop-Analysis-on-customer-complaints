library(readr)
library(ggplot2)
library(tidyverse)
library(tidytext)

rm(list=ls())

setwd("D:\\Documenti\\Università\\Business Data Analytics\\Workshop")

# Carico il dataset principale e il dataset degli unigrams 

data <- read_csv("dataset.csv")
view(data)

tokens <- read_csv("df_unigrams.csv")
view(tokens)

#Rimuovo stop words tra gli unigrams

tokens <- tokens %>%
  mutate(word_numeric = as.numeric(word)) %>%
  filter(is.na(word_numeric)) %>%
  filter(!is.na(word))     # Ci sono osservazioni con NA, quindi le elimino

#Tra i token ci sono molti caratteri come "x","xx","xxx", ... quindi li aggiungo alle stopwords ed eseguo l'antijoin.

my_stop_words <- tibble(word = c("x","xx","xxx","xxxx","xxxxx","xxxxxx","xxxxxxx","xxxxxxxx", "xxxxxxxx"), lexicon = "mywords")


tokens <- tokens %>%
  anti_join(my_stop_words)

# Creao una nuova tabella contenente gli unigrams con relativa frequenza

tokens_count <- tokens %>%
  count(word, sort = T)

# Plotto le parole più frequenti rappresentative del 2% del dataset totale

min_occur <- quantile(tokens_count$n, 0.98)

g <- tokens_count %>%
  filter(n >= min_occur) %>%
  slice_max(order_by = n, n = 30) %>%
  mutate(word = reorder(word,n)) %>%
  ggplot(aes(x = n, y = word)) +
  geom_col() +
  scale_x_continuous(labels = scales::comma) +
  xlab("Frequenza") +
  ylab("Tokens") +
  theme_minimal()

g  


# CO-WORD ANALYSIS -------------------------------------------------------------

library(tidyverse)
library(tidytext)
library(textdata)
library(plotly)
library(igraph)
library(ggraph)

tokens <- tokens %>%
  select(`Complaint ID`, word) %>%
  rename(Complaint_ID = `Complaint ID`)

# Costruisco il network bipartito

node1 <- tokens %>%
  distinct(Complaint_ID) %>%
  rename(node = Complaint_ID) %>%
  mutate(node = as.character(node), type = T)

node2 <- tokens %>%
  distinct(word) %>%
  rename(node = word) %>%
  mutate(node = as.character(node), type = F)

nodes <- bind_rows(node1, node2)

g_bip <- graph_from_data_frame(tokens, vertices = nodes, directed = F)

g <- bipartite_projection(g_bip, multiplicity = T, which = F)
g <- delete_edges(g, E(g)[E(g)$weight < 3])
cl <- components(g)
g <- induced_subgraph(g, which(cl$membership == which.max(cl$csize)))
V(g)$size <- strength(g)

g

community <- cluster_louvain(g)
V(g)$color <- community$membership

community <- cluster_louvain(g)

community

V(g)$community <- community$membership

V(g)$label <- ifelse(degree(g) >= quantile(degree(g), 0.50),
                     V(g)$name, "")

g_vis <- ggraph(g, layout = "fr") +
  geom_edge_link0(aes(edge_width = weight), edge_colour = "grey66") +
  geom_node_point(aes(size = size, fill = factor(community)),
                  colour = "white", shape = 21) +
  geom_node_text(aes(label = label), size = 1.5) +
  scale_edge_width(range = c(0.01, 0.1)) +
  scale_size(range = c(1, 10)) +
  theme_graph()

g_vis

write_graph(g, "network_with_names.gml", format = "gml")

# COSINE SIMILARITY ------------------------------------------------------------

library(tm)
library(lsa)

tokens_count_cosine <- tokens %>%
  count(Complaint_ID, word) %>%
  cast_dtm(Complaint_ID, word, n)

tokens_count_cosine

tokens_count_cosine <- lsa::cosine(as.matrix(tokens_count_cosine))
g_cos <- graph_from_adjacency_matrix(tokens_count_cosine, mode = "undirected", weighted = T)
g_cos <- delete_edges(g_cos, which(E(g_cos)$weight < 0.5))
cl <- components(g_cos)
g_cos <- induced_subgraph(g_cos, which(cl$membership == which.max(cl$csize)))
V(g_cos)$size <- strength(g_cos)
community <- cluster_louvain(g_cos)
V(g_cos)$community <- community$membership
g_cos

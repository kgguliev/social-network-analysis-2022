# SNA as a method
# 25 Jan 2022

# Packages ----

library(tidyverse)
library(network)
library(sna)
library(igraph)
library(RColorBrewer)

# Action ----

num_nodes <- 15

my_matrix <- matrix(round(runif(num_nodes*num_nodes)),
                    nrow = num_nodes,
                    ncol = num_nodes)

diag(my_matrix) <- 0 # to avoid self-reference of nodes (loops)

sum(is.na(my_matrix))

# Create a network ----

my_network <- as.network(x = my_matrix,
                         directed = TRUE,
                         loops = FALSE,
                         matrix.type = "adjacency")

network.size(my_network)
summary(my_network)

# Base plotting ----

par(mar = c(1, 1, 1, 1))

plot(my_network)

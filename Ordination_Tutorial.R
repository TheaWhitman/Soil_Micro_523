## Ordinations and Distance Metrics ##

# Last week you looked at the community composition of the tutorial samples
# Now we want to know, how do those communities compare?

# We will continue to use Phyloseq to graph and analyze our samples.
# There is a detailed tutorial on this:
# https://joey711.github.io/phyloseq/plot_ordination-examples.html

# This week, I'll be asking you to figure out the commands more on your own.
# I've put XX where you need to figure out what to write.

# First, remember to make sure your session is set to the right working directory
# (where your files are stored, especially our .biom file)


# Next, load the packages you need (just phyloseq this week)

library("XX")

# You will want to import the .biom file, as a phyloseq object,
# just like we did last week.
# Can you find the command we used in the script from last week?

ps = XX

# You may want to run this command to remove an additional weird sample
ps = prune_samples(sample_data(ps)$Description != "YUN1242.1", ps)

# And you likely want to remove the really low-abundance samples again
ps.cutoff = XX

# We will also want to transform the sample counts again
# to relative abundances, like last week. Can you find that command?

XX


# Once you've got your phyloseq object imported, with normalized abundances,
# you're ready to start looking at ordinations.

# Remember from our lecture in class, ordinations represent multidimensional data in lower-dimesional space
# Commonly used ordinations in microbial ecology include NMDS and PCoA.
# Ordinations are often performed on dissimilariry matrices
# Different formulae can be used to calculate dissimilarity
# e.g., Bray-Curtis

# Phyloseq has a function that creates an ordination, called ordinate()
# Call the help file for this function:

?ordinate()

# From scanning the help file, can you see what variables need to be included?
# Create an ordination below

MyOrdination = ordinate(XX, method="XX", distance="XX")

# Phyloseq also has a function that plots ordination, called plot_ordination()
# Call the help file for this function:

?plot_ordination()

# From scanning the help file, can you see what variables need to be included?
# Anything with a value after the equals sign in the Usage section of the help file
# indicates what the default parameters are. If you don't specify them,
# that is what will be used, but you can also change them.

# Plot your ordination below







# Once you've plotted the ordination, try the following:
# 1. Color the plot by soil properties, including pH, TOC, or other properties
  # The function colnames(sample_data(XX))  may be useful here
# 2. Use an dissimilarity other than bray - do the results change?
# 3. Use a different ordination method - again, do the results change?
# 4. Try something else, maybe from the tutorial link at the top of this exercise.

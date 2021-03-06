## Statistics ##

# We will be continuing with the samples from the QIIME Atacama soils tutorial
# https://docs.qiime2.org/2017.2/tutorials/atacama-soils/

# Two weeks ago, you looked at the community composition of the tutorial samples
# Last week, we plotted ordinations for those samples.
# However, we want to know, are the differences between communities significant?

# Today, we will be using PERMANOVA to answer this question.

# Again this week, I'll be asking you to figure out the commands more on your own.
# I've put XX where you need to figure out what to write.

# First, remember to make sure your session is set to the right working directory
# (where your files are stored, especially our .biom file)


# Next, load the packages you need (phyloseq and vegan this week)

library("XX")
library("XX")


# Go back to last week's ordination tutorial.
# You'll want to find the code to do the following:

# 1. Import our .biom file as a phyloseq object




# (probably you want to remove the weird sample again, 



# eliminate the really low-abundance samples, and



# transform sample counts to relative abundances).




# 2. Look back at the distance metrics you used in last week's ordination.
# Did you have reason to prefer one over another?
# Choose one, and create an object using the distance function (not the full ordination)

?phyloseq::distance
# putting PackageName::function() allows you to tell R to use
# the version of the function from a specific package.
# More than one package has distance functions, so we want
# to specify we will use the one from phyloseq

XX = phyloseq::distance(XX, method = "XX")

# Here, you've created a variable that is your distance matrix.
# Yo'll need this later

# We also need to extract the sample_data from the phyloseq object and turn it into a dataframe
XX = data.frame(sample_data(XX))

# You'll use this variable later as well.

# We want to know whether the distances between samples
# correspond to the treatments in our samples
# e.g., here, the two different sites, elevation, pH, etc.

# There are at least two ways of evaluating this question
# ANOSIM [https://mb3is.megx.net/gustame/hypothesis-tests/anosim]
# and NPMANOVA/PERMANOVA [https://mb3is.megx.net/gustame/hypothesis-tests/manova/npmanova]
# The GustaMe page has great explanations of both of these methods and their limitations.
# both can be carried out using the vegan package in R.
# Today, we'll be using PERMANOVA, which can take any dissimilarity measure
# (including non-Euclidean measures)
# and doesn't require that variables are independent (good for microbial communities)

# the function in vegan for PERMANOVA is actually called adonis
?adonis
# You'll see it requires a "formula".
# This is where we tell it what variables we are interested in comparing.
# For example,
adonis(YourDistanceMatrix ~ TransectName, data = YourSampleData)


# The Pr(>F) column from this result gives us the p-value for the model.

# Try running the adonis function using different sample variables, like pH
# remember: you can use any of the column names from your sample data
sample_data(ps)




# 3. When running a PERMANOVA, GustaMe reports:
# "Anderson (2001) warns that groups of objects with different dispersions, 
# yet no significant differences in centres (centres are similar to means, 
# but may be non-Euclidean), may result in misleadingly low P-values. 
# It is thus recommended that the dispersion be evaluated and considered when 
# interpreting the results of NPMANOVA. See Anderson (2006) for a discussion 
# on tests of multivariate dispersion."

# Thus, we should also look at the dispersion of our samples.
beta = betadisper(YourDistanceMatrix, YourSampleData$VariableofInterest)
permutest(beta)

# We want the betadisper results to not be significant.
# If that is the case, we will not reject the null hypothesis that our groups 
# have the same dispersions, so we can be more confident 
# that our adonis result is a real result, and not due to 
# differences in group dispersions [http://deneflab.github.io/MicrobeMiseq/demos/mothur_2_phyloseq.html]

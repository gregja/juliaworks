
# origin : https://community.ibm.com/community/user/powerdeveloper/blogs/swati-karmarkar/2022/09/07/julia-on-ibm-power

import Pkg
Pkg.add("Plots")

using Plots

# plot some data
plot([cumsum(rand(500) .- 0.5), cumsum(rand(500) .- 0.5)])

# directory for outputs
graphdir = "graphics"

# save the current figure
savefig("$graphdir/plots1.png")
savefig("$graphdir/plots1.svg")

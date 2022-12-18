# Source : https://grapeup.com/blog/getting-started-with-the-julia-language/

import Pkg
Pkg.add("Plots")

using Plots

f(x) = sin(x)cos(x)

# plot some data
plot(f, -2pi, 2pi)

# directory for outputs
graphdir = "graphics"

# save the current figure
savefig("$graphdir/plots2.png")
savefig("$graphdir/plots2.svg")

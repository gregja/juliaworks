# Source : https://github.com/gcalderone/Gnuplot.jl#a-slightly-more-complex-plot-with-unicode-on-x-tics

import Gnuplot

using Gnuplot

# directory for outputs
graphdir = "graphics"

x = 1.:20
@gp x x.^2 "with lines title 'Parabola'"

save("$graphdir/parabola.gp")  # => save a script file with both data and command to re-create the plot.

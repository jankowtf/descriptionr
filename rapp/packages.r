require("rapp.core.library")
require("devtools")
install.packages("roxygen2")
require("roxygen")
add_test_infrastructure()

roxygenize()
packrat::on()

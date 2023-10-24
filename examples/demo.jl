
import PublicationDatasets as DS

root_data_path = DS.getdatapath(DS.NMR2023())

@show readdir(root_data_path)
println()

all_structs = DS.findtrait("wing")
@show all_structs
println()

nmr2023_trait = DS.findtrait("10.5281/zenodo.8174260")
@show nmr2023_trait
println()


nothing
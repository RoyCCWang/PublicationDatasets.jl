module PublicationDatasets

using InteractiveUtils
using Tar, CodecZlib, DataDeps

include("nmr.jl")

# search.
include("LUT.jl")

export getdatapath,
findtrait,
getalltraits,
NMR2023

end # module PublicationDatasets

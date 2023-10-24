# PublicationDatasets.jl
Convenience routines that uses DataDeps.jl to download and store public data sets.

The main routine is `getdatapath()`, which returns the root folder of the extracted data set.

# Install
Add the custom registries for this repository, then add this package.
```
using Pkg
Pkg.Registry.add(RegistrySpec(url = "https://github.com/RoyCCWang/RWPublicJuliaRegistry"))
pkg"add NMRSignalSimulator"
```

# Citation
Please cite the individual datasets if you use them in your work. The citation information should be visible to you when DataDeps.jl prompts you to download it. You can also find the citation information for a data set by searching this respoitory for the digital object identifier (DOI) of the data set.

## Data sets
[NMR 2023](https://doi.org/10.5281/zenodo.8174261)
```julis
import PublicationDatasets as DS
root_data_path = DS.getdatapath(DS.NMR2023())
```

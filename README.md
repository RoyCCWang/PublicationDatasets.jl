# PublicationDatasets.jl
Convenience routines that uses DataDeps.jl to download and store public data sets.

# Usage
The focus of this package is the function `getdatapath`, which returns the root folder of the extracted data set. Each data set is given a composite data type (See the Data sets section below), and one of the field names of this composite type is `DOI`, which is a `String` that contains the digital object identifier (DOI) of the data set.

To find the composite type associated with a data set, called a *trait* here, use `findtrait(DOI)`, where `DOI` is the DOI of the target data set, stored as a `String`.

Use `getalltraits()` to get all possible traits. You can then check each of their `DOI` fields to get the DOI for all the data sets referenced in this package.

See `\examples/demo.jl` for an example.

# Install
Add the custom registries for this repository, then add this package.
```
using Pkg
Pkg.Registry.add(RegistrySpec(url = "https://github.com/RoyCCWang/RWPublicJuliaRegistry"))
pkg"add PublicationDatasets"
```

# Citation
Please cite the individual datasets if you use them in your work. The citation information should be visible to you when DataDeps.jl prompts you to download it. You can also find the citation information for a data set by searching this respoitory for the DOI of the data set.

## Data sets
[NMR 2023](https://doi.org/10.5281/zenodo.8174261)
```julis
import PublicationDatasets as DS
root_data_path = DS.getdatapath(DS.NMR2023(); overwirte = false)
```

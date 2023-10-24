
### types for loading NMR experiment data, and to save models and fit results.

abstract type DatasetTrait end

# we don't use keyword struct to allow maximum Julia version compatibility.

struct NMR2023 <: DatasetTrait
    DOI::String
end

function NMR2023()
    return NMR2023("10.5281/zenodo.8174260")
end

# should never use overwrite = true here, since this data is on Zenodo.
function getdatapath(::NMR2023; overwrite = false)::String

    dataset_alias = "AI4DBiological-Systems_NMR_data" # don't use spaces or 'strange' symbols like commas, colons, etc.
    archive_file_name = "nmr_physical_parameters_dataset.tar.gz" # the filename on the data repository that we download.
    url = "https://zenodo.org/record/8174261/files/nmr_physical_parameters_dataset.tar.gz?download=1"

    
    #readdir(datadep"AI4DBiological-Systems NMR data") # have to manually type out the alias. Does not allow string variable substitution.
    try @datadep_str("$dataset_alias")
        if overwrite
            register(
                DataDep(
                    "$dataset_alias",
                    """
                    Dataset: Selected BMRB 1D 1H NMR data and physical chemistry values compiled from literature
                    Author: Roy Chih Chung Wang
                    License: [Creative Commons Attribution Non Commercial Share Alike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)
                    DOI: 10.5281/zenodo.8174261
    
                    Description:
                    The experiments were downloaded from BMRB,
                    The physical chemistry parameters data and sample configuration-related files were collected, organized, converted or manually entered in as JSON files by Roy.
                    The physical chemistry parameters, i.e., chemical shift and J-coupling values, are from two sources:
                    - GISSMO: (https://gissmo.bmrb.io/ acccessed Mar. 2023). See Dashti, et. al. DOI: 10.1021/acs.analchem.8b02660 and DOI: 10.1021/acs.analchem.7b02884 for more details.
                    - From Govindaraju, et. al.'s work: DOI: 10.1002/1099-1492(200005)13:3<129::AID-NBM619>3.0.CO;2-V
    
                    Please cite the data sources and this data repository if you find the contents helpful for your work. See the Zenodo DOI entry for more description.
                    """,
                    url
                ),
            )
        end
    catch
        register(
            DataDep(
                "$dataset_alias",
                """
                Dataset: Selected BMRB 1D 1H NMR data and physical chemistry values compiled from literature
                Author: Roy Chih Chung Wang
                License: [Creative Commons Attribution Non Commercial Share Alike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)
                DOI: 10.5281/zenodo.8174261

                Description:
                The experiments were downloaded from BMRB,
                The physical chemistry parameters data and sample configuration-related files were collected, organized, converted or manually entered in as JSON files by Roy.
                The physical chemistry parameters, i.e., chemical shift and J-coupling values, are from two sources:
                - GISSMO: (https://gissmo.bmrb.io/ acccessed Mar. 2023). See Dashti, et. al. DOI: 10.1021/acs.analchem.8b02660 and DOI: 10.1021/acs.analchem.7b02884 for more details.
                - From Govindaraju, et. al.'s work: DOI: 10.1002/1099-1492(200005)13:3<129::AID-NBM619>3.0.CO;2-V

                Please cite the data sources and this data repository if you find the contents helpful for your work. See the Zenodo DOI entry for more description.
                """,
                url
            ),
        )
    end

    local_dataset_archive_path = @datadep_str("$dataset_alias") # call the actual macro to allow string variable substitution.

    # extract archive, then delete. Do this only if archive file still exists.

    root_data_path = joinpath(local_dataset_archive_path, "contents")
    
    if isfile(joinpath(local_dataset_archive_path, archive_file_name))
        t = @task begin;
            ispath(root_data_path) || mkpath(root_data_path);
        end
        schedule(t); wait(t)
    
        #@show local_dataset_archive_path, archive_file_name
        #@show root_data_path

        #t = @task begin; Tar.extract(joinpath(local_dataset_archive_path, archive_file_name), root_data_path); end
        t = @task begin;
            extractuncompress(
                joinpath(
                    local_dataset_archive_path,
                    archive_file_name,
                ),
                root_data_path,
            );
        end
        schedule(t); wait(t)
        rm(joinpath(local_dataset_archive_path, archive_file_name)) # delete the archive file.
    end

    return root_data_path
end

function extractuncompress(src_path, dest_path)
    tar_gz = open(src_path)
    tar = CodecZlib.GzipDecompressorStream(tar_gz)
    dir = Tar.extract(tar, dest_path)
    close(tar)
    
    return dir
end


#### WIP assign it to DatasetTrait when ready, otherwise it'll show up in findtrait().

struct NMRResults2023 #<: DatasetTrait
    DOI::String
end

function NMRResults2023()
    return NMRResults2023("WIP")
end

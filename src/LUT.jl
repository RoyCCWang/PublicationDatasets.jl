function findtrait(query_DOI::String)

    struct_list = getalltraits()

    inds = findall(xx->xx.DOI==query_DOI, struct_list)

    if isnothing(inds) || isempty(inds)
        println("Cannot find the specified DOI in PublicationDatasets.jl. Returning `nothing`.")

        return nothing
    end

    return struct_list[inds]
end

function getalltraits()
    type_list = subtypes(DatasetTrait)

    return collect( type_list[n]() for n in eachindex(type_list) )
end

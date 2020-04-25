"""
    DivideInput

    Input of a divide algorithm used by the tree search algorithm.
    Contains the parent node in the search tree for which children should be genrated.
"""
struct DivideInput <: AbstractInput
    parent::Node
    optstate::OptimizationState
end

getparent(input::DivideInput) = input.parent
getoptstate(input::DivideInput) = input.optstate

"""
    DivideOutput

    Output of a divide algorithm used by the tree search algorithm.
    Should contain the vector of generated nodes.
"""
struct DivideOutput <: AbstractOutput 
    children::Vector{Node}
    optstate::OptimizationState
end

getchildren(output::DivideOutput) = output.children
getoptstate(output::DivideOutput) = output.optstate

"""
    AbstractDivideAlgorithm

    This algoirthm type is used by the tree search algorithm to generate nodes.
"""
abstract type AbstractDivideAlgorithm <: AbstractAlgorithm end

function run!(algo::AbstractDivideAlgorithm, reform::Reformulation, input::DivideInput)::DivideOutput
    algotype = typeof(algo)
    error("Method run! which takes Reformulation and DivideInput as parameters and returns DivideOutput 
           is not implemented for algorithm $algotype.")
end    

# this function is needed to check whether the best primal solution should be copied to the node optimization state
exploits_primal_solutions(algo::AbstractDivideAlgorithm) = false
module MathProg

import BlockDecomposition
import Distributed
import MathOptInterface
import TimerOutputs

import ..Coluna # for NestedEnum (types.jl:210)
using ..Coluna: iterate # to be deleted
using ..Containers

import Base: haskey, length, iterate, diff

using DynamicSparseArrays
using Logging
using Printf

global const BD = BlockDecomposition
global const MOI = MathOptInterface
global const MOIU = MathOptInterface.Utilities
global const TO = TimerOutputs
const Cl = Coluna

include("counters.jl")
include("types.jl")
include("vcids.jl")
include("variable.jl")
include("constraint.jl")
include("duties.jl")
include("varconstr.jl") # to rm
include("manager.jl")
include("optimizationresults.jl")
include("incumbents.jl")
include("buffer.jl")
include("formulation.jl")
include("new_varconstr.jl") 
include("optimizerwrappers.jl")
include("clone.jl")
include("reformulation.jl")
include("projection.jl")
include("problem.jl")
include("decomposition.jl")
include("MOIinterface.jl")

# TODO : clean up
# Types
export AbstractFormulation, MaxSense, MinSense, MoiOptimizer, VarMembership, 
       Variable, Constraint, OptimizationResult, VarDict,
       ConstrDict, Id, ConstrSense, VarSense, Formulation, Reformulation, VarId,
       ConstrId, Incumbents, DualSolution, PrimalSolution,
       PrimalBound, DualBound, FormId, FormulationPhase, Problem, Annotations,
       Original, Counter, UserOptimizer, MoiObjective, PrimalSolVector

export INFEASIBLE, UNKNOWN_FEASIBILITY, FEASIBLE, OPTIMAL

# Methods
export no_optimizer_builder, set_original_formulation!,
       setvar!, getid, store!, setconstr!, getuid, getcoefmatrix,
       getvar, getvars, getconstr, getconstrs, getsense,
       register_objective_sense!, optimize!, nbprimalsols, ip_gap, getdualbound,
       getprimalbound, get_ip_dual_bound, getmaster, deactivate!, 
       enforce_integrality!, relax_integrality!, activate!, update_ip_primal_sol!,
       getobjsense, getoptimizer, getbestprimalsol, get_ip_primal_bound, get_ip_primal_sol,
       add_primal_sol!, setdualbound!, determine_statuses, getvalue,
       isfeasible, getterminationstatus, getfeasibilitystatus,
       getprimalsols, getdualsols, update_lp_primal_sol!,
       computereducedcost, isaStaticDuty, isaDynamicDuty, isanOriginalRepresentatives, 
       isanArtificialDuty,
       update_ip_dual_bound!, update_lp_dual_bound!,
       get_lp_primal_bound, update!,
       convert_status, getduty, getbestdualsol, update_lp_dual_sol!,
       projection_is_possible, proj_cols_on_rep, get_lp_dual_bound,
       computereducedrhs, 
       unsafe_getbestprimalsol,
       set_lp_primal_bound!, update_ip_primal_bound!,
        find_owner_formulation,
       setfeasibilitystatus!, setterminationstatus!, get_dw_pricing_sps, 
       setprimalsol!, setdualsol!, getsortuid, setcol_from_sp_primalsol!,
       get_benders_sep_sps, setcut_from_sp_dualsol!, getprimalsolmatrix,
       contains, set_ip_primal_bound!, set_lp_dual_bound!

# Below this line, clean up has been done :
export reformulate!

# Methods related to variables and constraints
export getperenecost,
       getcurcost,
       setcurcost!,
       getperenelb,
       getcurlb,
       setcurlb!,
       getpereneub,
       getcurub,
       setcurub!,
       getperenerhs,
       getcurrhs,
       setcurrhs!,
       getperenesense,
       getcursense,
       setcursense!,
       getperenekind,
       getcurkind,
       setcurkind!,
       getpereneincval,
       getcurincval,
       setcurincval!,
       ispereneactive,
       iscuractive,
       activate!,
       deactivate!,
       ispereneexplicit,
       iscurexplicit,
       setiscurexplicit!,
       getname,
       reset!

# Methods related to Problem
export set_initial_dual_bound!, set_initial_primal_bound!,
       get_initial_dual_bound, get_initial_primal_bound

# Translation methods
export convert_coluna_sense_to_moi,
       convert_moi_sense_to_coluna,
       convert_moi_rhs_to_coluna,
       convert_moi_kind_to_coluna

end
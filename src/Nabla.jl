__precompile__()

module Nabla

    # Some aliases used repeatedly throughout the package.
    export ∇Scalar, ∇Array, SymOrExpr, ∇ArrayOrScalar
    const ∇Scalar = Number
    const ∇Array = AbstractArray{<:∇Scalar}
    const ∇AbstractVector = AbstractVector{<:∇Scalar}
    const ∇AbstractMatrix = AbstractMatrix{<:∇Scalar}
    const ∇ArrayOrScalar = Union{AbstractArray{<:∇Scalar}, ∇Scalar}
    const SymOrExpr = Union{Symbol, Expr}


    # Meta-programming utilities specific to Nabla.
    include("code_transformation/util.jl")
    include("code_transformation/differentiable.jl")

    # Functionality for constructing computational graphs.
    include("core.jl")

    # Functionality for defining new sensitivities.
    include("sensitivity.jl")

    # Finite differencing functionality - only used in tests. Would be good to move this
    # into a separate module at some point.
    include("finite_differencing.jl")

    # Sensitivities for the basics.
    include("sensitivities/indexing.jl")
    include("sensitivities/scalar.jl")
    include("sensitivities/array.jl")

    # Sensitivities for functionals.
    include("sensitivities/functional/functional.jl")
    include("sensitivities/functional/reduce.jl")
    include("sensitivities/functional/reducedim.jl")

    # Linear algebra optimisations.
    include("sensitivities/linalg/generic.jl")
    include("sensitivities/linalg/symmetric.jl")
    include("sensitivities/linalg/strided.jl")
    include("sensitivities/linalg/blas.jl")
    include("sensitivities/linalg/diagonal.jl")
    include("sensitivities/linalg/triangular.jl")
    include("sensitivities/linalg/factorization/cholesky.jl")

end # module Nabla

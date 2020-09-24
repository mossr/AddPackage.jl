# AddPackage.jl

[![Build Status](https://travis-ci.com/mossr/AddPackage.jl.svg?branch=master)](https://travis-ci.com/mossr/AddPackage.jl) [![codecov](https://codecov.io/github/mossr/AddPackage.jl/coverage.svg?branch=master)](https://codecov.io/gh/mossr/AddPackage.jl)

An `@add` macro to automatically add a missing package when calling `using Package` in Julia.

Example:
```julia
@add using Distributions
```

This will run `using Distributions` if it's already installed, otherwise will install the package, then run `using Distributions`.

## Installation:
```julia
] add AddPackage
```

## Usage:
```julia
using AddPackage
@add using Distributions
@add using Random, Parameters, LinearAlgebra
```

---

Written by [Robert Moss](https://github.com/mossr).

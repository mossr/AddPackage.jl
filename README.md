# AddPackage.jl

[![Build Status](https://travis-ci.com/mossr/AddPackage.jl.svg?branch=master)](https://travis-ci.com/mossr/AddPackage.jl) [![codecov](https://codecov.io/github/mossr/AddPackage.jl/coverage.svg?branch=master)](https://codecov.io/gh/mossr/AddPackage.jl)

An `@add` macro to automatically add a missing package when calling `using Package` in Julia.

Example:
```julia
@add using Clustering
```

This will run `using Clustering` if it's already installed, otherwise will install the package, then run `using Clustering`.

## Installation:
```julia
] add https://github.com/mossr/AddPackage.jl
```

## Usage:
```julia
using AddPackage
@add using Clustering
@add using Random, NearestNeighbors, LinearAlgebra
```

---

Written by [Robert Moss](https://github.com/mossr).
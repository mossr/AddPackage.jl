using Test
using Pkg
using AddPackage

@testset "Check missing package" begin
    @test begin
        pass = false
        try
            using Clustering
        catch err
            if err isa ArgumentError
                pass = true
            end
        end
        pass
    end
end

@testset "Adding missing package" begin
    @test begin
        @add using Clustering
        kmeans isa Function
    end
end

@testset "Adding multiple packages" begin
    @test begin
        @add using Random, NearestNeighbors, LinearAlgebra
        shuffle isa Function && knn isa Function && dot isa Function
    end
end

@testset "Fail on package not in General" begin
    @test_throws Pkg.Types.PkgError begin
        @add using NotARealPackage
    end
end

using Test
using Pkg
using AddPackage

@testset "Check missing package" begin
    @test begin
        pass = false
        try
            using Distributions
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
        @add using Distributions
        Distributions isa Module
    end
end

@testset "Adding multiple packages" begin
    @test begin
        @add using Random, Parameters, LinearAlgebra
        Random isa Module && Parameters isa Module && LinearAlgebra isa Module
    end
end

@testset "Fail on package not in General" begin
    @test_throws Pkg.Types.PkgError begin
        @add using NotARealPackage
    end
end

module AddPackage

using Pkg

export @add

macro add(expr)
    @assert expr.head == :using
    packages = [string(arg.args[end]) for arg in expr.args]
    expr_block = Expr(:block)
    for pkg in packages
        using_package = Meta.parse("using $pkg")
        push!(expr_block.args, quote
            local error2throw = missing
            try
                $(esc(using_package))
            catch err
                if err isa ArgumentError
                    try
                        Pkg.add("$($pkg)")
                        $(esc(using_package))
                    catch adderr
                        if adderr isa Pkg.Types.PkgError
                            # Store error so full error stack is not thrown
                            error2throw = adderr
                        else
                            throw(adderr)
                        end
                    end
                else
                    throw(err)
                end
            end
            if !(error2throw isa Missing)
                throw(error2throw)
            end
        end)
    end
    return expr_block
end

end # module

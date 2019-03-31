function u1(x)
    return x^3
end

function u2(x)
    return x^4
end

function centered_diff(u, h)
    x = 1
    return (u(x + h) - u(x - h))/2h
end

function main()
    h = [0.5^i for i = 1:4]
    for i = 1:4
    println("================================================================")
    println( "when u(x) = x^3 and h = $(h[i]) : ", centered_diff(u1, h[i]))
    println( "the difference to the derivative : ", centered_diff(u1, h[i]) - 3)
    println( "1/6h^2u''' : ", 1/6*h[i]^2*6)
    println("================================================================")
    println( "when u(x) = x^4 and h = $(h[i]) : ", centered_diff(u2, h[i]))
    println( "the difference to the derivative : ", centered_diff(u2, h[i]) - 4)
    println( "1/6h^2u''' : ", 1/6*h[i]^2*24)
    end
end


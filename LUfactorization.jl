# ===========================
# Problem 2(a)
# ===========================

function LU(M)
    n = size(M)[1]
    L = zeros(n,n)
    U = zeros(n,n) 
   
    for i = 1:n
        L[i,i] = 1
        U[1,i] = M[1,i]
    end

    for i = 1:n
        for k = i:n
            s = 0
            for j = 1:(i-1)
                s += L[i,j] * U[j,k]
            end
            U[i,k] = M[i,k] - s
            if U[i,i] == 0 
                error("Zero diagonal in U!")
            end
        end
        for k = i+1:n
            s = 0
            for j = 1:(i-1)
                s += L[k,j] * U[j,i]
            end
            L[k,i] = (M[k,i] - s) / U[i,i]
        end
    end
    return (L, U)
end

# A = (L,U)
# A[1] 

# ===========================
# Problem 2(b)
# ===========================

function Kn(n)
    k = zeros(n,n)
    for i = 1:n
        k[i,i] = 2
        if i < n
            k[i,i+1] = -1
        end
        if i > 1 
            k[i,i-1] = -1
        end
    end
    return k
end

function Tn(n)
    t = zeros(n,n)
    t[1,1] = 1
    for i = 1:n
        if i < n
            t[i+1,i+1] = 2
            t[i,i+1] = -1
        end
        if i > 1
            t[i,i-1] = -1
        end
    end
    return t 
end

function main()
    for n = [3, 5, 11, 15]
    println("=====================")
    println("for Kn, if n=$(n): ", LU(Kn(n)))
    println("=====================")
    println("for Tn, if n=$(n): ", LU(Tn(n)))
    end
end

# ===========================
# Problem 2(c)
# ===========================

function forward_sub(L,b)
    n = length(b)
    c = zeros(n)
    c[1] = b[1]
    for i = 2:n
        s = 0
        for j = 1:i-1
            s += L[i,j] * c[j]
        end 
        c[i] = b[i] - s
    end
    return c
end

function backward_sub(U,c)
    n = length(c)
    x = zeros(n)
    x[n] = c[n]/U[n,n]
    for i = n-1:-1:1
        s = 0
        for j = n:-1:i+1
            s += U[i,j] * x[j] 
        end
        x[i] = (c[i] - s)/U[i,i]
    end
    return x
end

# ===========================
# Problem 3(a)
# ===========================

function LU_Calc(M,x)
    h = 1/(size(M)[1]+1)
    L = LU(M)[1]
    U = LU(M)[2]
    
    f = forward_sub(L,x)
    b = backward_sub(U,f)
    return b*h^2
end

x1 = (1/16)*[1:15...]
Sol_3a = LU_Calc(Kn(15),x1)

# ===========================
# Problem 3(b)
# ===========================

function ExactSol(x)
    return -1/6 .* x .^ 3 + 1/6 .* x
end

Error_3b = ExactSol(x1) - Sol_3alogin?product=2&return_to=https%3A%2F%2Fwww.meistertask.com%2Fko%2Fapp%2Fdashboard

# Plotting

# using Winston

#plot(x,ExactSol(x)) 
#plot!(x,Sol_3a)

# ===========================
# Problem 3(c)
# ===========================

# for n = 100
x2 = (1/101)*[1:100...]
Sol_3c1 = LU_Calc(Kn(100),x2)
Error_3c1 = ExactSol(x2) - Sol_3c1
# for n = 200
x3 = (1/201)*[1:200...]
Sol_3c2 = LU_Calc(Kn(200),x3)
Error_3c2 = ExactSol(x3) - Sol_3c2

# Plotting

#plot(x2, Sol_3c1, "bo", x2, ExactSol(x2), "r-")
#scatter(x3, Sol_3c2, label="approx2", size=(1200,800), dpi=300)
#plot!(x3, ExactSol(x3), label="exact2")
#savefig("Plot3c.png")

# ===========================
# Problem 4(a)
# ===========================

Sol_4a = LU_Calc(Tn(15),x1)

# ===========================
# Problem 4(b)
# ===========================

function ExactSol2(x) 
    return -1/6 .* x .^3
end

Error_4b = ExactSol2(x1) - Sol_4a

# Plotting

# ===========================
# Problem 4(c)
# ===========================

# for n = 100
x2 = (1/101)*[1:100...]
Sol_4c1 = LU_Calc(Tn(100),x2)
Error_4c1 = ExactSol2(x2) - Sol_4c1
# for n = 200
x3 = (1/201)*[1:200...]
Sol_4c2 = LU_Calc(Tn(200),x3)
Error_4c2 = ExactSol2(x3) - Sol_4c2

# Plotting

# ===========================
# Problem 5(a)
# ===========================

function domain(x)
    return cos.(4*pi .* x)
end

function ExactSol3(M)
    return (1/4*pi)^2 .* (M .- 1)
end

# ===========================
# Problem 5(b)
# ===========================

# n=4
Sol_5b1 = LU_Calc(Kn(4), domain(1/5 .* [1:4...]))

# n=8
Sol_5b2 = LU_Calc(Kn(8), domain(1/9 .* [1:8...]))

# ===========================
# Problem 5(c)
# ===========================


# ===========================
# Problem 6(a)
# ===========================

function ExactSol4(x) 
    return x .+ (1/(1-exp(1))) .* (exp.(x) .- 1)
end

# ===========================
# Problem 6(b)
# ===========================

function centered_diff(n)
    M = zeros(n,n)
    for i = 1:n
        M[i,i] = 0
        if i+1 <= n
            M[i, i+1] = 1
        end
        if i-1 > 0
            M[i, i-1] = -1
        end
    end
    return M
end

# if h = 1/5 => n = 4

A = 5^2 .* Kn(4) + 10 .* centered_diff(4)

LU(A)
La = LU(A)[1]
Ua = LU(A)[2]

x4 = [1,1,1,1]
Sol_A = LU_Calc(A, x4)

# ===========================
# Problem 6(c)
# ===========================

function forward_diff(n)
    M = zeros(n,n)
    for i = 1:n
        M[i,i] = -1
        if i < n
            M[i,i+1] = 1
        end
    end
    return M
end

B = 5^2 .* Kn(4) + 5 .* forward_diff(4)

Sol_B = LU_Calc(B, x4)
    
# ===========================
# Problem 6(d)
# ===========================
Sol_6a = ExactSol4(x4)
Error_6d1 = Sol_6a - Sol_A
Error_6d2 = Sol_6a - Sol_B


# Plotting : Sol_6a & Sol_A & Sol_B 


# ===========================
# Problem 2(a)
# ===========================

function LU(M)
# =========================== 
# Initialization
# ===========================
    n = size(M)[1]
    L = zeros(n,n)
    U = zeros(n,n) 
    for i = 1:n
        L[i,i] = 1
        U[1,i] = M[1,i]
    end
# ===========================
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

L = LU(M)[1]
U = LU(M)[2]

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
    for i = 1:n-1
        s = 0
        for j = i+1:n
            s += U[i,j] * x[j] 
        end
        x[n-i] = (c[n-i] - s)/U[n-i,n-i]
    end
    return x
end

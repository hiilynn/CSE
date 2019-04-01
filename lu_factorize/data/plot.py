import pickle
import pylab as plt

#with open("prob_3a.pickle", "rb") as fr:
#    data_3a = pickle.load(fr)

plt.rc('text', usetex=True)
plt.rc('font', family='serif')
## 3-b
#
#plt.figure(figsize=(10,6), dpi=300)
#plt.plot(data_3a[0], data_3a[1], 'ro', label=r'Approx')
#plt.plot(data_3a[0], data_3a[2], 'b-', label=r'Exact')
#plt.title(r'Problem 3-b)', fontsize=16)
#plt.xlabel(r'$x$', fontsize=14)
#plt.ylabel(r'$y$', fontsize=14)
#plt.grid()
#plt.legend(fontsize=12)
#plt.savefig("prob_3b.png", dpi=300)

# 3-c
#with open("prob_3c_1.pickle", "rb") as fr:
#    data_3c_1 = pickle.load(fr)
#
#with open("prob_3c_2.pickle", "rb") as fr:
#    data_3c_2 = pickle.load(fr)
#
#plt.figure(figsize=(10,6), dpi=300)
#plt.plot(data_3c_1[0], data_3c_1[1], 'r.', label=r'Approx $(n=100)$', alpha=0.2)
#plt.plot(data_3c_1[0], data_3c_1[2], 'r-', label=r'Exact $(n=100)$', alpha=0.2)
#plt.plot(data_3c_2[0], data_3c_2[1], 'b.', label=r'Approx $(n=200)$', alpha=0.2)
#plt.plot(data_3c_2[0], data_3c_2[2], 'b-', label=r'Exact $(n=200)$', alpha=0.2)
#plt.title(r'Problem 3-c)', fontsize=16)
#plt.xlabel(r'$x$', fontsize=14)
#plt.ylabel(r'$y$', fontsize=14)
#plt.grid()
#plt.legend(fontsize=12)
#plt.savefig("prob_3c.png", dpi=300)

# 4-c
with open("prob_4c_1.pickle", "rb") as fr:
    data_4c_1 = pickle.load(fr)

with open("prob_4c_2.pickle", "rb") as fr:
    data_4c_2 = pickle.load(fr)

plt.figure(figsize=(10,6), dpi=300)
plt.plot(data_4c_1[0], data_4c_1[1], 'r.', label=r'Approx $(n=100)$', alpha=0.2)
plt.plot(data_4c_1[0], data_4c_1[2], 'r-', label=r'Exact $(n=100)$', alpha=0.2)
plt.plot(data_4c_2[0], data_4c_2[1], 'b.', label=r'Approx $(n=200)$', alpha=0.2)
plt.plot(data_4c_2[0], data_4c_2[2], 'b-', label=r'Exact $(n=200)$', alpha=0.2)
plt.title(r'Problem 4-c)', fontsize=16)
plt.xlabel(r'$x$', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)
plt.grid()
plt.legend(fontsize=12)
plt.savefig("prob_4c.png", dpi=300)


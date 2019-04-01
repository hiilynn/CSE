import pickle
import pylab as plt

with open("prob_3a.pickle", "rb") as fr:
    data_3a = pickle.load(fr)

plt.rc('text', usetex=True)
plt.rc('font', family='serif')

plt.figure(figsize=(10,6), dpi=300)
plt.plot(data_3a[0], data_3a[1], 'ro', label=r'Approx')
plt.plot(data_3a[0], data_3a[2], 'b-', label=r'Exact')
plt.title(r'Problem 3-b)', fontsize=16)
plt.xlabel(r'$x$', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)
plt.grid()
plt.legend(fontsize=12)
plt.savefig("prob_3b.png", dpi=300)

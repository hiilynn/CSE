extern crate peroxide;
use peroxide::*;

fn main() {

    // Problem 3-a)
    {
        let x = seq(1, 15, 1).fmap(|t| t/16f64);
        let x_plot = seq(0,16,1).fmap(|t| t/16f64);
        let (a, b, c) = coeff_gen(15);
        let m = tdma(a,b,c,x.clone());
        let result_temp = matrix(
            {
                let mut temp = cat(0f64, m.data.clone());
                temp.push(0f64);
                temp
            },
            m.row + 2,
            m.col,
            m.shape,
        );
        let exact = x_plot.clone().fmap(|t| exact_sol(t));
        let result: Matrix = cbind!(x_plot.to_matrix(), result_temp, exact.to_matrix());
        result.write_pickle("data/prob_3a.pickle").expect("Can't write prob3a");
    }
}

fn exact_sol(x: f64) -> f64 {
    - x.powi(3)/6f64 + x/6f64
}

fn coeff_gen(n: usize) -> (Vec<f64>, Vec<f64>, Vec<f64>) {
    let h = 1f64 / ((n+1) as f64);
    (
        vec![-1f64; n-1].fmap(|t| t/h.powi(2)),
        vec![2f64; n].fmap(|t| t/h.powi(2)),
        vec![-1f64; n-1].fmap(|t| t/h.powi(2)),
    )
}

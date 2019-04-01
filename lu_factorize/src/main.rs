extern crate peroxide;
use peroxide::*;
use std::f64::consts::PI;

fn main() {

    // Problem 3-b)
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
    // Problem 3-c)
    {
        let x1 = seq(1, 100, 1).fmap(|t| t/101f64);
        let x2 = seq(1, 200, 1).fmap(|t| t/201f64);
        let x1_plot = seq(0,101,1).fmap(|t| t/101f64);
        let x2_plot = seq(0,201,1).fmap(|t| t/201f64);
        let (a1, b1, c1) = coeff_gen(100);
        let (a2, b2, c2) = coeff_gen(200);
        let m1 = tdma(a1,b1,c1,x1.clone());
        let m2 = tdma(a2,b2,c2,x2.clone());
        let result_temp1 = matrix(
            {
                let mut temp = cat(0f64, m1.data.clone());
                temp.push(0f64);
                temp
            },
            m1.row + 2,
            m1.col,
            m1.shape,
        );
        let result_temp2 = matrix(
            {
                let mut temp = cat(0f64, m2.data.clone());
                temp.push(0f64);
                temp
            },
            m2.row + 2,
            m2.col,
            m2.shape,
        );
        let exact1 = x1_plot.clone().fmap(|t| exact_sol(t));
        let exact2 = x2_plot.clone().fmap(|t| exact_sol(t));
        let result1: Matrix = cbind!(x1_plot.to_matrix(), result_temp1, exact1.to_matrix());
        let result2: Matrix = cbind!(x2_plot.to_matrix(), result_temp2, exact2.to_matrix());
        result1.write_pickle("data/prob_3c_1.pickle").expect("Can't write prob3c1");
        result2.write_pickle("data/prob_3c_2.pickle").expect("Can't write prob3c2");
    }
    // Problem 4-c)
    {
        let x1 = seq(1, 100, 1).fmap(|t| t/101f64);
        let x2 = seq(1, 200, 1).fmap(|t| t/201f64);
        let x1_plot = seq(0,101,1).fmap(|t| t/101f64);
        let x2_plot = seq(0,201,1).fmap(|t| t/201f64);
        let (a1, d1, c1) = coeff_gen(100);
        let (a2, d2, c2) = coeff_gen(200);
        let mut b1 = d1.clone();
        b1[0] = 1f64;
        let mut b2 = d2.clone();
        b2[0] = 1f64;
        let m1 = tdma(a1,b1,c1,x1.clone());
        let m2 = tdma(a2,b2,c2,x2.clone());
        let result_temp1 = matrix(
            {
                let mut temp = cat(0f64, m1.data.clone());
                temp.push(0f64);
                temp
            },
            m1.row + 2,
            m1.col,
            m1.shape,
        );
        let result_temp2 = matrix(
            {
                let mut temp = cat(0f64, m2.data.clone());
                temp.push(0f64);
                temp
            },
            m2.row + 2,
            m2.col,
            m2.shape,
        );
        let exact1 = x1_plot.clone().fmap(|t| exact_sol(t));
        let exact2 = x2_plot.clone().fmap(|t| exact_sol(t));
        let result1: Matrix = cbind!(x1_plot.to_matrix(), result_temp1, exact1.to_matrix());
        let result2: Matrix = cbind!(x2_plot.to_matrix(), result_temp2, exact2.to_matrix());
        result1.write_pickle("data/prob_4c_1.pickle").expect("Can't write prob4c1");
        result2.write_pickle("data/prob_4c_2.pickle").expect("Can't write prob4c2");
    }
    // Problem 5-c)
    {
        let x = seq(1, 15, 1).fmap(|t| t/16f64);
        let x_plot = seq(0,16,1).fmap(|t| t/16f64);
        let (a, b, c) = coeff_gen(15);
        let m = tdma(a,b,c,x.fmap(|t| (t * 4f64 * PI).cos()));
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
        let exact = x_plot.clone().fmap(|t| (0.25*PI).powi(2) * (t - 1f64));
        let result: Matrix = cbind!(x_plot.to_matrix(), result_temp, exact.to_matrix());
        result.write_pickle("data/prob_5c.pickle").expect("Can't write prob5c");
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

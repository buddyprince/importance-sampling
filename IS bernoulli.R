importance_simulation_bernoulli = function(n,threshold,p,iteration=1000){
  a = threshold/n
  theta_a = log(a*(1-p))-log(p*(1-a))
  alpha_n = c()
  for (i in 1:iteration){
    # generate S_n
    S_n = sum(
      sample(
        x = c(0,1),
        size = n,
        prob = c(1-a,a),
        replace = T
      )
    )
    #generate estimator alpha_n
    if (S_n>=threshold){
      alpha_n[i] = exp(-theta_a*S_n + n*(log(1-p)-log(1-a)))
    }
    else{
      alpha_n[i] = 0
    }
  }
  return(list(
    sum(alpha_n)/iteration,
    alpha_n
  ))
}

real_bernoulli = function(n,threshold,p){
  sum = 0
  for (i in threshold:n){
    sum = sum + choose(n,i)*p^i*(1-p)^(n-i)
  }
  return(sum)
}

compare_bernoulli = function(n,p){
  IS_b = c()
  r_b = c()
  for (i in 1:n){
    IS_b[i] = importance_simulation_bernoulli(n,i,p,1000)
    r_b[i] = real_bernoulli(n,i,p)
  }
  plot(1:n,r_b,type="l")
  points(1:n,IS_b,pch = 16)
  return(data.frame(real=r_b, IS=IS_b))
  
}

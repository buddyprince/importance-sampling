phi_uniform = function(theta,a=0,b=1){
  return(
    log(exp(theta*b)-exp(theta*a))-log(theta*(b-a))
  )
}

p_theta = function(x,theta,a=0,b=1){
  if (x<a){
    E = 0
  }
  else if (x>=a && x<=b){
    E = integrate(
      function(t) exp(theta*t-phi_uniform(theta,a,b))*1/(b-a),
      a,x
    )$value
  }
  else{
    E = 1
  }
  return(E)
}

importance_simulation_uniform = function(n,threshold,a=0,b=1,iteration=500){
  a_1 = threshold/n
  
  #compute theta_a
  theta_a = uniroot(
    function(x) (b-a)/exp((b-a)*x-1)-1/x+b-a_1,
    interval = c(a, b),
    extendInt='yes',
    tol = 0.0001
  )$root
  
  alpha_n = c()
  for (i in 1:iteration){
    # generate S_n
    #(1) generate unif(0,1)
    u = runif(n)
    
    #(2) F-1(u)
    inverse_u = c()
    for (j in 1:n){
      inverse_u[j] = uniroot(
        function(x) p_theta(x,theta_a,a,b)-u[j],
        interval = c(a, b),
        extendInt='yes',
        tol = 0.0001
      )$root
    }
    
    #(3) S_n
    S_n = sum(inverse_u)
    # generate estimator alpha_n
    if (S_n>=threshold){
      alpha_n[i] = exp(-theta_a*S_n + n*phi_uniform(theta_a,a,b))
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

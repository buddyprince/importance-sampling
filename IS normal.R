phi_normal = function(theta,mean,var){
  return(mean*theta+1/2*var*theta^2)
}

p_theta = function(x,theta,mean=0,var=1){
  E = integrate(
    function(t) exp(theta*t-phi_normal(theta,mean,var))*
      (1/sqrt(2*pi*var))*exp(-(t-mean)^2/(2*var)),
    -Inf,x
  )$value
  return(E)
}

importance_simulation_normal = function(n,threshold,mean=0,var=1,iteration=100){
  a = threshold/n
  
  #compute theta_a
  theta_a = (a-mean)/var

  alpha_n = c()
  for (i in 1:iteration){
    # generate S_n
    #(1) generate unif(0,1)
    u = runif(n)

    #(2) F-1(u)
    inverse_u = c()
    for (j in 1:n){
      inverse_u[j] = uniroot(
        function(x) p_theta(x,theta_a,mean,var)-u[j],
        interval = c(-3*var, 3*var),
        extendInt='yes',
        tol = 0.0001
      )$root
    }
    
    #(3) S_n
    S_n = sum(inverse_u)
      
    # generate estimator alpha_n
    if (S_n>=threshold){
      alpha_n[i] = exp(-theta_a*S_n + n*phi_normal(theta_a,mean,var))
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



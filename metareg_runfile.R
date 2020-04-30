#this file runs the data in stan
library(rstan)
source('metareg_define_data.R')

fit0.5 <- stan(
  file = "metareg0.5.stan",  # Input model version here 
  data = hh_trial_data,      # named list of data defined in metareg_define_data.R
  chains = 2,                # number of Markov chains
  warmup = 1000,             # number of warmup iterations per chain
  iter = 100000,             # total number of iterations per chain
  cores = 2,                 # number of cores (could use one per chain)
  refresh = 1000,            # no of runs at which progress is shown
  control = list(max_treedepth = 15,adapt_delta=0.8)
)

params = c("c0", "b0", "b[1]","b[2]","b[3]","b[4]","b[5]","b[6]","c[1]","c[2]","c[3]","c[4]","c[5]" )

summary(fit0.5, pars = params)
traceplot(fit0.5, pars = params)
plot(fit0.5, pars = params)

save(fit0.5, file='../../../../Desktop/model0.5HHCOVID.Rdata')



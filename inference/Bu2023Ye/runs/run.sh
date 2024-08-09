export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1

### User settings here:
export prior_filename=AT2017gfo_dL44 # choose prior, also used as label

mpiexec -np 16 lightcurve-analysis \
    --model Bu2023Ye \
    --svd-path ../../../train/svdmodels \
    --outdir ./outdir/ \
    --label $prior_filename \
    --trigger-time 57982.5285236896 \
    --data ../data/AT2017gfo_corrected.dat \
    --prior ../priors/$prior_filename.prior \
    --tmin 0.05 \
    --tmax 14 \
    --dt 0.1 \
    --error-budget 1 \
    --nlive 2048 \
    --Ebv-max 0 \
    --interpolation-type tensorflow \
    --local-only \
    --plot

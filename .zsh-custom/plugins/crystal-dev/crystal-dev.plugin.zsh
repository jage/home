# Set CRYSTAL_OPTS for LavinMQ development.
# Will be default in Crystal 1.20, then we can delete this.
chpwd() {
  if [[ $PWD == */lavinmq* ]]; then
    export CRYSTAL_OPTS="-Dpreview_mt -Dexecution_context"
  else
    unset CRYSTAL_OPTS
  fi
}
chpwd

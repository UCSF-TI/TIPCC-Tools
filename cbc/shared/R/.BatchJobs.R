######################################################################
# A BatchJobs cluster configuration R script
#
# Author: Henrik Bengtsson
#
# References:
# [1] https://github.com/tudo-r/BatchJobs/wiki/Configuration
######################################################################

cluster.functions <- makeClusterFunctionsTorque("/home/shared/cbc/R/.BatchJobs,torque.tmpl")

# PATCH: http://goo.gl/YuYqoi
cluster.functions$listJobs = function(conf, reg) {
  runOSCommandLinux("qselect", "-u $USER -s EHQRTW")$output
}

# To avoid file system locks, cf. [1]
staged.queries <- TRUE

######################################################################
# HISTORY:
# 2014-09-10
# o Now staging queries.
# 2013-12-18
# o Shared on the cluster.
######################################################################

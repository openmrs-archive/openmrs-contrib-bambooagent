node default {
  # this tree/puppet-control only have one role; hence we are skipping roles and using only profiles. 
  
  include profiles::basic_configuration
  include profiles::scm
  include profiles::docker
  include profiles::node_buildtime
  include profiles::ruby_buildtime
#  include profiles::browsers
  include profiles::transifex
#  include profiles::java_buildtime
}
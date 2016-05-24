define bamboo_agent_home::file (
  $bamboo_user_home_1 = hiera('bamboo_agent_home::file::bamboo_user_home_1'),
  $bamboo_user_home_2 = hiera('bamboo_agent_home::file::bamboo_user_home_2'),
  $source,
  $destination = $name,
  $mode   = '644',
){
  file { ["${bamboo_user_home_1}/${destination}","${bamboo_user_home_2}/${destination}"]:
    mode   => $mode,
    source => $source,
  }
}
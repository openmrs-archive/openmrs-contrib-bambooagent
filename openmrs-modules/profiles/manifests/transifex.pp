class profiles::transifex {
  package { 'transifex-client':
    ensure  => latest,
  }
  bamboo_agent_home::file { '.transifexrc':
    source      => 'puppet:///profiles/transifex/dot-transifexrc',
  }
}
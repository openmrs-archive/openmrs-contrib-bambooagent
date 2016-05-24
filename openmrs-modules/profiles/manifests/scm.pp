class profiles::scm {
  package { ['git', 'subversion' ]: 
    ensure  => latest,
  }
}
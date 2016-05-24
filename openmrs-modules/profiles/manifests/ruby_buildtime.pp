class profiles::ruby_buildtime (
  $grailsVersion = "2.3.7"
){
   wget::fetch { 'fetch grails' :
    source  => "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-${grailsVersion}.zip",
    destination => "/opt/grails-${grailsVersion}.zip",
    timeout     => 1800,
    require => Package['unzip']
  }
  -> 
  exec { 'extract grails' :
    command => "/usr/bin/unzip -o grails-${grailsVersion}.zip",
    cwd     => '/opt',
    creates => "/opt/grails-${grailsVersion}",
  }
  -> 
  file { 'link grails' :
    path   => '/opt/grails',
    ensure => 'link',
    target => "/opt/grails-${grailsVersion}",    
  }
}
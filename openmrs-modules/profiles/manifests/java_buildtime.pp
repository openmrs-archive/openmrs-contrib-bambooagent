class profiles::java_buildtime (
  $maven3version = "3.2.5",
){
  apt::ppa { 'ppa:openjdk-r/ppa' : }
  -> 
  package { [ 'maven2', 'ant','openjdk-7-jre','openjdk-6-jdk', 'openjdk-8-jdk']:
    ensure  => present,
  }
  
  # install maven 3
  wget::fetch { 'fetch maven 3':
    source      => "http://apache.mirrors.pair.com/maven/maven-3/${maven3version}/binaries/apache-maven-${maven3version}-bin.zip",
    destination => '/tmp/mvn3.zip',
    require => Package['unzip']
  } 
  -> 
  exec { 'extract maven 3':
    command => "/usr/bin/unzip -o /tmp/mvn3.zip",
    cwd     => "/usr/share/",
    creates => "/usr/share/apache-maven-${maven3version}/",
  }
  -> 
  file { 'link mvn' :
    path   => '/bin/mvn3',
    ensure => 'link',
    target => "/usr/share/apache-maven-${maven3version}/bin/mvn",    
  }
  
  
  exec{ "update-java-alternatives -s java-1.7.0-openjdk":
    path    => ["/usr/bin", "/usr/sbin"],
    require => [ 
                  Package['openjdk-7-jre'],
                  Package['openjdk-6-jdk'], 
                  Package['openjdk-8-jdk'] 
               ],
  }
}
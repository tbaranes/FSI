Pod::Spec.new do |s|
  s.name     = 'FSI'
  s.version  = '0.3.0'
  s.license  = 'Apache'
  s.summary  = 'A delightful iOS library.'
  s.homepage = 'https://github.com/tbaranes/FSI'
  s.authors  = { 'Tom Baranes' => 'tom.baranes@gmail.com' }
  s.source   = { :git => 'https://github.com/tbaranes/FSI.git', :tag => "0.3.0", :submodules => false }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'

  s.public_header_files = 'FSI/*.h'
  s.source_files = 'FSI/*.{h,m}'
end

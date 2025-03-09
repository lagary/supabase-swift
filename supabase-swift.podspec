Pod::Spec.new do |s|
  s.name             = 'supabase-swift'
  s.version          = '0.1.0'
  s.summary          = 'Swift client for Supabase'
  s.description      = <<-DESC
                        Swift client for Supabase - an open source Firebase alternative.
                        Includes Auth, Functions, PostgREST, Realtime, and Storage modules.
                       DESC
  s.homepage         = 'https://github.com/lagary/supabase-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Supabase' => 'info@supabase.io' }
  s.source           = { :git => 'https://github.com/supabase-community/supabase-swift.git', :tag => s.version.to_s }
  
  s.swift_version = '5.9'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.watchos.deployment_target = '6.0'
  s.tvos.deployment_target = '13.0'
  
  # Common dependencies for all subspecs
  # s.dependency 'ConcurrencyExtras', '~> 1.1.0'
  # s.dependency 'CustomDump', '~> 1.3.2'
  # s.dependency 'Swift-Clocks', '~> 1.0.0'
  # s.dependency 'XCTestDynamicOverlay', '~> 1.2.2'
  # s.dependency 'HTTPTypes', '~> 1.3.0'
  
  s.source_files = 'Sources/**/**/*'
  
  # Swift settings
  s.compiler_flags = '-DExistentialAny -enable-experimental-feature StrictConcurrency'
end

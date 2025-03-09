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
  s.dependency 'ConcurrencyExtras', '~> 1.1.0'
  s.dependency 'CustomDump', '~> 1.3.2'
  s.dependency 'Swift-Clocks', '~> 1.0.0'
  s.dependency 'XCTestDynamicOverlay', '~> 1.2.2'
  s.dependency 'HTTPTypes', '~> 1.3.0'
  
  # Define base subspec for common helpers
  s.subspec 'Helpers' do |helpers|
    helpers.source_files = 'Sources/Helpers/**/*'
  end
  
  # Define Auth subspec
  s.subspec 'Auth' do |auth|
    auth.source_files = 'Sources/Auth/**/*'
    auth.dependency 'Supabase/Helpers'
    auth.dependency 'SwiftCrypto', '~> 2.0.0'
  end
  
  # Define Functions subspec
  s.subspec 'Functions' do |functions|
    functions.source_files = 'Sources/Functions/**/*'
    functions.dependency 'Supabase/Helpers'
  end
  
  # Define PostgREST subspec
  s.subspec 'PostgREST' do |postgrest|
    postgrest.source_files = 'Sources/PostgREST/**/*'
    postgrest.dependency 'Supabase/Helpers'
  end
  
  # Define Realtime subspec
  s.subspec 'Realtime' do |realtime|
    realtime.source_files = 'Sources/Realtime/**/*'
    realtime.dependency 'Supabase/Helpers'
  end
  
  # Define Storage subspec
  s.subspec 'Storage' do |storage|
    storage.source_files = 'Sources/Storage/**/*'
    storage.dependency 'Supabase/Helpers'
  end
  
  # Main "Supabase" spec that depends on all modules
  s.default_subspec = 'Core'
  s.subspec 'Core' do |core|
    core.source_files = 'Sources/Supabase/**/*'
    core.dependency 'Supabase/Auth'
    core.dependency 'Supabase/Functions'
    core.dependency 'Supabase/PostgREST'
    core.dependency 'Supabase/Realtime'
    core.dependency 'Supabase/Storage'
  end
  
  # Swift settings
  s.compiler_flags = '-DExistentialAny -enable-experimental-feature StrictConcurrency'
end

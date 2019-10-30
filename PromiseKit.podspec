Pod::Spec.new do |s|
  s.name = "PromiseKit"

  `xcodebuild -project PromiseKit.xcodeproj -showBuildSettings` =~ /CURRENT_PROJECT_VERSION = ((\d\.)+\d)/
  abort("No version detected") if $1.nil?
  abort("Not tagged") unless `git tag`.split.include? $1
  s.version = $1

  s.source = {
    :git => "https://github.com/typora/PromiseKit.git",
    :branch => "v7",
    :submodules => true
  }

  s.license = 'MIT'
  s.summary = 'Promises for Swift & ObjC.'
  s.homepage = 'http://promisekit.org'
  s.description = 'A thoughtful and complete implementation of promises for iOS, macOS, watchOS and tvOS with first-class support for both Objective-C and Swift.'
  s.social_media_url = 'https://twitter.com/mxcl'
  s.authors  = { 'Max Howell' => 'mxcl@me.com' }
  s.documentation_url = 'http://promisekit.org/docs/'
  s.default_subspecs = 'Foundation', 'UIKit', 'QuartzCore'
  s.requires_arc = true

  # CocoaPods requires us to specify the root deployment targets
  # even though for us it is nonsense. Our root spec has no
  # sources.
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.13'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.subspec 'CorePromise' do |ss|
    hh = Dir['Sources/*.h']

    cc = Dir['Sources/*.swift']
    cc += hh
    
    ss.source_files = cc
    ss.public_header_files = hh
    ss.frameworks = 'Foundation'
    
    ss.ios.deployment_target = '8.0'
    ss.osx.deployment_target = '10.13'
    ss.watchos.deployment_target = '2.0'
    ss.tvos.deployment_target = '9.0'
  end
end

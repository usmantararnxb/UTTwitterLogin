Pod::Spec.new do |s|
  s.name             = 'UTTwitterLogin'
  s.version          = '0.0.1'
  s.summary          = 'Twitter Login - Swift'

  s.description      = <<-DESC
Integrate Social login in your application with simple steps.
                       DESC

  s.homepage         = 'https://github.com/usmantararnxb/UTTwitterLogin'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Usman Tarar' => 'usman.tarar@nxb.com.pk' }
  s.source           = { :git => 'https://github.com/usmantararnxb/UTTwitterLogin.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'UTTwitterLogin/Source/**/*.{swift}'

  s.dependency  "TwitterKit"

end






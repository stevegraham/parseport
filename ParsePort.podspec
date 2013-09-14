Pod::Spec.new do |s|
  s.name         = "ParsePort"
  s.version      = "0.0.1"
  s.summary      = "ParsePort - leave Parse whenever you want"
  s.description  = <<-DESC
    ParsePort allows you the option to leave Parse in the future by providing a
    kill-switch that can be used to force the Parse SDK to communicate with
    an arbitrary host nominated at runtime instead of the Parse API.
  DESC

  s.homepage     = "https://github.com/stevegraham/parseport"

  s.license      = 'MIT'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Stevie Graham" => "sjtgraham@mac.com" }

  s.source       = { :git    => "https://github.com/stevegraham/parseport.git",
                     :commit => "b4e0ec72ac5a072642197a1796a7bdb97f2a99ba" }

  s.platform     = :ios

  s.source_files = 'Classes', 'Classes/**/*.{h,m}'

  s.requires_arc = true
end

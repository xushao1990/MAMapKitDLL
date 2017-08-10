Pod::Spec.new do |s|
  s.name         = "MAMapKitDLL"
  s.version      = "4.6.0.1"
  s.summary      = "MAMapKit Dynamic Library for iOS."
  s.description  = "MAMapKit + AMapFoundationKit Dynamic Library for iOS."
  s.homepage     = "https://github.com/xushao1990/MAMapKitDLL"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Tongtong Xu" => "xushao1990@126.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xushao1990/MAMapKitDLL.git", :tag => "#{s.version}" }
  s.vendored_frameworks = 'Product/MAMapKitDLL.framework'
end
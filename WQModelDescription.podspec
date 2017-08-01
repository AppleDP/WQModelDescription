Pod::Spec.new do |s|
  s.name         = "WQModelDescription"
  s.version      = "1.0.0"
  s.summary      = "将模型对象的所有属性信息输出到控制台"
  s.description  = <<-DESC
  将模型对象的所有属性信息输出来控制台
                   DESC

  s.homepage      = "https://github.com/AppleDP/WQModelDescription"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "AppleDP" => "SWQAppleDP@163.com" }
  s.source        = { :git => "https://github.com/AppleDP/WQModelDescription.git", :tag => s.version }
  s.source_files  = "WQModelDescription/**/WQModelDescription/*.{h,m}"
end

Pod::Spec.new do |spec|
  spec.name         = "MZDrawBoardView"
  spec.version      = "0.0.1"
  spec.summary      = "画板组件、实现简单绘画、清空、生成图片功能"
  spec.homepage     = "https://github.com/1691665955/MZDrawBoardView"
  spec.authors         = { 'MZ' => '1691665955@qq.com' }
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.source = { :git => "https://github.com/1691665955/MZDrawBoardView.git", :tag => spec.version}
  spec.platform     = :ios, "9.0"
  spec.swift_version = '5.0'
  spec.source_files  = "MZDrawBoardView/MZDrawBoardView/*"
end

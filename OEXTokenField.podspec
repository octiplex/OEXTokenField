Pod::Spec.new do |s|
  s.name                = "OEXTokenField"
  s.version             = "0.0.1"
  s.summary             = "A subclass of NSTokenField that allows token customization."
  s.homepage            = "http://www.octiplex.com/"
  s.license             = "Modified BSD License"
  
  s.author              = { "Octiplex" => "contact@octiplex" }
  s.source              = { :git => "https://github.com/octiplex/OEXTokenField.git" }
  
  s.platform            = :osx, "10.7"
  s.source_files        = "*.{m,h}"
  s.public_header_files = [ "OEXTokenAttachmentCell.h", "OEXTokenField.h", "OEXTokenFieldCell.h" ]
  s.requires_arc        = true
  
  s.documentation       = { :appledoc => ["--explicit-crossref", "--preprocess-headerdoc", "--no-repeat-first-par"] }
end
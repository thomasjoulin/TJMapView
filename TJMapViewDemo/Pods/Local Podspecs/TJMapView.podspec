Pod::Spec.new do |s|
  s.name         = "TJMapView"
  s.version      = "0.0.1"
  s.summary      = "An MKMapView subclass adding some extra functionalities."
#  s.description  = "TJFoundation aims to extend Core Foundation by providing base classes and extending core classes with useful features that most iOS project would need."
  s.homepage     = "https://github.com/thomasjoulin/TJMapView"
  s.license      = {
    :type => 'MIT',
    :text => <<-LICENSE
              Copyright (C) <2012> <Thomas Joulin>
              All rights reserved.
    LICENSE
  }

  s.author       = { "Thomas Joulin" => "toutankharton@gmail.com" }
  s.source       = { :git => "/Users/thomas/Dropbox/TJMapView/", :tag => "v0.0.1" }
  s.platform     = :ios
  s.source_files = 'TJMapView/*.{h,m}'
  s.frameworks 	 = 'MapKit', 'CoreLocation'
  s.requires_arc = true
  s.dependency     'AFNetworking', '1.0'
  s.dependency     'TJFoundation', :git => "/Users/thomas/Dropbox/TJFoundation/", :commit => "cb04993"
end

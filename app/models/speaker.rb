class Speaker < ActiveRecord::Base
  #before_filter :require_login, :only => :secret
  has_attached_file :avatar, 
    #:styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => "rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename ",
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

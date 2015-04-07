class Speaker < ActiveRecord::Base
  # before_filter :require_login, :only => :secret
  has_attached_file :avatar,
 :path => ":rails_root/public/system/:class/:attachement/:id/:basename_:style.:extension",
    :url => "/system/:class/:attachement/:id/:basename_:style.:extension",
    :styles => {
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }

  validates_attachment :avatar,
    :presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  validates :name,
    :presence => true,
    :uniqueness => true

  
  #                   :styles => { :original => "300x300>", :thumb => "100x100>" },
  #                   path: 'rails_root/public/system/speakers/avatar/:filename ',
  #                   #url: '/system/speakers/avatars/mindy_kaplan.jpg ',
  #                    url: '/system/speakers/avatar/:filename ',
  #                   default_url: '/images/:style/missing.png'
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

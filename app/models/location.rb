class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Geocoder::Model::Mongoid

  
  embedded_in :user #, inverse_of => :locations

  field :loc, type: String
  field :coordinates, :type => Array
  field :journal, type: String
  field :date, type: Date
  field :time, type: Time


  geocoded_by :loc
  after_validation :geocode 

  validates :journal, length: {minimum: 1, maximum: 140}
  validates :loc,  presence: true
  #scope :rails, -> {where('loc LIKE ?', '%San Francisco%')}
  #default_scope {order('date DESC')}
end

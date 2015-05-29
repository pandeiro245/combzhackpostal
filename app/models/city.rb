class City < ActiveRecord::Base
  belongs_to :pref
  has_many :postals
end

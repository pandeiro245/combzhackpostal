class Pref < ActiveRecord::Base
  has_many :cities
  has_many :postals
end

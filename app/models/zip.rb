class Zip < ActiveRecord::Base
  belongs_to :pref
  belongs_to :city
end

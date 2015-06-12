class City < ActiveRecord::Base
  belongs_to :pref
  has_many :postals
  store :info, accessors: [:population2005, :population2010, :size]

  def pop
    population2010
  end
end

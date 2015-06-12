class Pref < ActiveRecord::Base
  has_many :cities
  has_many :postals
  store :info, accessors: [:population2005, :population2010, :size]

  def pop
    (population2010.to_i/10000).to_i
  end
end


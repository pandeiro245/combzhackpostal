class Pref < ActiveRecord::Base
  has_many :cities
  has_many :postals
  store :info, accessors: [:population2005, :population2010, :size]

  def pop(type=2010)
    if type.to_i == 2005
      (population2005.to_i/10000).to_i
    else
      (population2010.to_i/10000).to_i
    end
  end
end


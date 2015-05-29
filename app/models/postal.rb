class Postal < ActiveRecord::Base
  belongs_to :pref
  belongs_to :city

  def self.import
    file_path = './KEN_ALL.csv'

    open(file_path, 'r:cp932:utf-8', undef: :replace) do |f|
      csv = CSV.new(f, :headers => :first_row)
      csv.each do |row|
        next if row.header_row?

        table = Hash[[row.headers, row.fields].transpose]

        postal = Postal.find_or_create_by(code: table['code'])
        postal.pref = Pref.find_or_create_by(name: table['pref'])
        postal.city = City.find_or_create_by(name: table['city'])
        postal.city.pref = postal.pref
        postal.city.save!
        postal.lot = table['lot']
        1.upto(6).each do |i|
          postal.send("flag#{i}=", table["flag#{i}"])
        end
        postal.save!
      end
    end
    return 'done'
  end
end


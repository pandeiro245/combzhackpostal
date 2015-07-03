class Stock
  def initialize
    @date = Date.today
    @code = 7203
  end

  def date
    @date
  end

  def before_diffs count = 30
    before(count).map{|js| [js.high - js.low, js.date]}
  end

  def before_heights count = 30
    before(count).map{|js| js.high }
  end

  def before count = 30
    JpStock.historical_prices(code: @code, start_date: @date - count.days, end_date: @date)
  end

  def after count = 30
    'TODO: 未来の数字！'
  end

  def show 
    puts @date
    if @date <= Date.today
      JpStock.price(code: @code, date: @date)
    else
      'TODO: 未来の数字！'
    end
  end

  def tomorrow!
    @date += 1.day
  end

  def yesterday!
    @date -= 1.day
  end
end


class WelcomeController < ApplicationController
  def index
    @type = params[:year] || nil
  end

  def toyota
    @years = params[:years] || 10
    length = 366 * @years.to_i
    @data = Rails.cache.fetch("diff_#{length}", expires_in: 1.year) do
       Stock.new.before_diffs(length)
    end
    @kv = {}
    @data.each do |item|
      year = item.last.to_date.year
      @kv[year] = {name: "#{year}年", data: {}} unless @kv[year]
      @kv[year][:data][date2thisyear(item.last)] = item.first if [Date.today.month, (Date.today + 1.month).month].include?(item.last.month)
    end
    @lines = []
    @kv.each do |year, line|
      @lines.push(line)
    end
  end

  private
  def date2thisyear date
    Date.new(Date.today.year, date.month, date.day)
  end
end


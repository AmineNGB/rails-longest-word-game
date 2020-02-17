require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
    @voyelles = %w[a e i o u y]
    @tab = []
    8.times do
      @tab << ('a'..'z').to_a.sample
    end
    @tab << @voyelles.sample
    @tab << @voyelles.sample
    @tab.shuffle!
  end
  def score
    @lol = []
    @lol2 = []
    @bool = []
    @word = params[:word]
    @tab2 = params[:tab]
    @word.split('').each { |w| @lol << w }
    @tab2.split('').each { |w| @lol2 << w }
    @hihi = @lol.each do |x|
      @bool << @lol2.include?(x)
    end
    @result_bool = @bool.include?(false)
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @open_url = open(@url).read
    @parse_url = JSON.parse(@open_url)
    @test = @parse_url['found']
  end
end

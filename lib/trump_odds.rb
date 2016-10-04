require "trump_odds/version"
require "nokogiri"

URL = "http://projects.fivethirtyeight.com/2016-election-forecast/"

class TrumpOdds
  @@chance = nil

  def self.report(chance, difference)
    message = "There is a #{chance} chance Donald Trump will become president."

    if difference == 0
      title = "Trump Odds"
      sound = "default"
    elsif difference > 0
      title = "Odds have gotten worse by #{difference.abs.round(3)}%"
      sound = "Basso"
    else
      title = "Odds have improved by #{difference.abs.round(3)}%"
      sound = "Purr"
    end

    `echo '#{message}' | terminal-notifier -title '#{title}' -sound '#{sound}' -appIcon './icon.png' -appIcon './icon.png' -closeLabel -actions Close -open #{URL}`
  end

  def self.check
    page = Nokogiri::HTML(open(URL))
    chance = page.css(".candidate.rep .winprob")[0].text
    new_chance = chance[0..-1].to_f

    return if !@@chance.nil? && new_chance == @@chance

    self.report(chance, @@chance.nil? ? 0 : new_chance - @@chance)

    @@chance = new_chance
  end
end

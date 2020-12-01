require 'twilio-ruby'

class Game
  SAGRADA_OPTIONS = [
    "Blue 🔵",
    "Purple 🟣",
    "Green 🟢",
    "Red 🔴",
    "Yellow 🟡"
  ]

  SPY_ALLEY_OPTIONS = [
    "Russian 🇷🇺",
    "American 🇺🇸",
    "Italian 🇮🇹",
    "Spanish 🇪🇸",
    "German 🇩🇪",
    "French 🇫🇷"
  ]

  NUMBERS = [
    "+16179095182",
    # "+16179095125",
    # "+16176787408",
    # "+16177687566",
    # "+18578560001"
    # "+16178932870"
  ]

  def self.execute
    new.execute
  end

  def execute
    shuffled_numbers.each_with_index do |number, index|
      client.messages.create(message(number, SPY_ALLEY_OPTIONS[index])) if number
    end
  end

  def message(to, body)
    {
      from: "+12056973587",
      to: to,
      body: body
    }
  end

  def client
    @client ||= Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  end

  def shuffled_numbers
    NUMBERS.shuffle
  end
end

Game.execute
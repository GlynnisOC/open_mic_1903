class OpenMic
  attr_reader :location, :date, :performers, :repeated_jokes

  def initialize(open_mic_details)
    @location = open_mic_details[:location]
    @date = open_mic_details[:date]
    @performers = []
    @repeated_jokes = false
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes?
    @repeated_jokes
    if @performers.jokes.each do |joke|
      joke.dup
      true
    end 
  end
end

#after telling another user the joke, should change to false

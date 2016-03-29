class DataController < ApplicationController

  def index
    sheep = Sheep.where('created_at', Time.now - 60*60).order('created_at DESC')
    
    data = Hash.new(0)
    sheep.each do |s|
      if s.flag == 1
        data[s.created_at.strftime("%H:%M")] = 1
      end
    end
    @tmp = data
    
    @data = []
    now = Time.now - 1
    (0..60).each do |t|
      @data << {
        time: (now - t * 60).strftime("%H:%M"),
        data: data[(now - t * 60).strftime("%H:%M")]
                  } 
    end
    
    
  end
end

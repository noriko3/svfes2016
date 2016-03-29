class MainController < ApplicationController


  
  def iruyo
    Sheep.create!(flag: 1)
    return render json: "{}"
  end

  def inaiyo
    Sheep.create!(flag: 2)
    return render json: "{}"
  end

  def reset
    Sheep.create!(flag: 0)
    `curl -X POST --data-urlencode 'payload={"channel": "#mofu_test", "username": "mofumofu_bot", "text": "mofumofu reset", "icon_emoji": ":sheep:"}' https://hooks.slack.com/services/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`
    return render json: "{}"
  end

end

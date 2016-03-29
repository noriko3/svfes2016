# coding: utf-8
# rails runner "Tasks::Min::execute"

class Tasks::Min
  def self.execute
    p Sheep.where('created_at > ?', Time.now - 60*60).to_sql
    check_time = Time.now - 30
    iru = Sheep.where('created_at > ?', check_time).where(flag: 1)
    inai = Sheep.where('created_at > ?', check_time).where(flag: 2)
    all = Sheep.where('created_at > ?', check_time)

    mything_time = [13,28,43,58]
    
    #`curl -X POST "http://210.140.82.66/data/88d7aeef-d0f3-4369-8a95-8d5263d992f8" --header "meshblu_auth_uuid: 88d7aeef-d0f3-4369-8a95-8d5263d992f8" --header "meshblu_auth_token: 39913e1c" -d "hoge=1"`
    
    if inai == all
      Sheep.create!(flag: 0)
      `curl -X POST --data-urlencode 'payload={"channel": "#mofu_test", "username": "mofumofu_bot", "text": "reset", "icon_emoji": ":sheep:"}' https://hooks.slack.com/services/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`
      return false
    end
    #if  Sheep.where('created_at > ?', Time.now - 60*60).where(flag: 0).count > 0
    if  Sheep.where('created_at > ?', Time.now - 60).where(flag: 0).count > 0
      p 'none'
      `curl -X POST --data-urlencode 'payload={"channel": "#mofumofu", "username": "mofumofu_bot", "text": "@noriko 進捗どうですか！", "icon_emoji": ":sheep:"}' https://hooks.slack.com/services/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`
      return false
    else
      if Log.where(data_type: 'rest').where('created_at > ?', Time.now - 60).count == 0
        'osirase'
        `curl -X POST --data-urlencode 'payload={"channel": "#mofumofu", "username": "mofumofu_bot", "text": "@noriko 休憩時間ですよー！", "icon_emoji": ":sheep:"}' https://hooks.slack.com/services/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`
        Log.create!(data_type: 'rest')
      end
      if mything_time.include?(Time.now.strftime("%m"))
        `curl -X POST "http://210.140.82.66/data/88d7aeef-d0f3-4369-8a95-8d5263d992f8" --header "meshblu_auth_uuid: 88d7aeef-d0f3-4369-8a95-8d5263d992f8" --header "meshblu_auth_token: 39913e1c" -d "hoge=1"`
        Log.create!(data_type: 'mythings')
      end
    end
    
  end
end

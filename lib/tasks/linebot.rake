namespace :linebot do
  desc 'LINEbotでメッセージを送る'

  task remind: :environment do
    poor_dogs = Dog.no_dog_cares_since_yesterday
    return unless poor_dogs
    poor_dogs.each do |dog|
      client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV['LINE_MESSAGING_SECRET']
        config.channel_token = ENV['LINE_MESSAGING_TOKEN']
      }
      uid = dog.user.line_uid
      message = {
        type: 'text',
        text: "#{dog.name}の様子はどうですか？お世話をしたらpetlogに記録しましょう。"
      }
      client.push_message(uid, message)
    end
  end
end

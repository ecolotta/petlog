module Api
  class LinebotController < Api::ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :require_login
    require 'line/bot'
    require 'net/http'
    require 'json'

    def client
      @client ||= Line::Bot::Client.new do |config|
        config.channel_secret = ENV['LINE_MESSAGING_SECRET']
        config.channel_token = ENV['LINE_MESSAGING_TOKEN']
      end
    end

    def webhook
      body = request.body.read
      signature = request.env['HTTP_X_LINE_SIGNATURE'] # リクエストがLINEから送られたことを確認するための署名
      unless client.validate_signature(body, signature) # LINEからきたことを検証
        head :bad_request
      end
      events = client.parse_events_from(body) # jsonをインスタンスに変更

      events.each do |event|
        case event
        when Line::Bot::Event::Message # アカウント連携開始※ボタンなどに変更する
          case event.message['text']
          when 'フレックス' # リッチメニューからお世話登録を選択した時に出る選択肢
            message = {
              "type": 'flex',
              "altText": 'This is a Flex Message',
              "contents": {
                "type": 'bubble',
                "body": {
                  "type": 'box',
                  "layout": 'vertical',
                  "contents": [
                    {
                      "type": 'box',
                      "layout": 'horizontal',
                      "contents": [
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'ごはん',
                            "data": 'care_type, 1'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        },
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'おさんぽ',
                            "data": 'care_type, 2'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        }
                      ],
                      "paddingAll": 'sm',
                      "spacing": 'md',
                      "position": 'relative'
                    },
                    {
                      "type": 'box',
                      "layout": 'horizontal',
                      "contents": [
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'おもちゃ',
                            "data": 'care_type, 3'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        },
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'グルーミング',
                            "data": 'care_type, 4'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        }
                      ],
                      "paddingAll": 'sm',
                      "spacing": 'md',
                      "position": 'relative'
                    },
                    {
                      "type": 'box',
                      "layout": 'horizontal',
                      "contents": [
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'おくすり',
                            "data": 'care_type, 5'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        },
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'おそうじ',
                            "data": 'care_type, 6'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        }
                      ],
                      "paddingAll": 'sm',
                      "spacing": 'md',
                      "position": 'relative'
                    },
                    {
                      "type": 'box',
                      "layout": 'horizontal',
                      "contents": [
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": '芸の練習',
                            "data": 'care_type, 7'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        },
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": '見つめ合い',
                            "data": 'care_type, 8'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        }
                      ],
                      "paddingAll": 'sm',
                      "spacing": 'md',
                      "position": 'relative'
                    },
                    {
                      "type": 'box',
                      "layout": 'horizontal',
                      "contents": [
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": '撫でた',
                            "data": 'care_type, 9'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        },
                        {
                          "type": 'button',
                          "action": {
                            "type": 'postback',
                            "label": 'その他',
                            "data": 'care_type, 10'
                          },
                          "color": '#008000',
                          "style": 'primary'
                        }
                      ],
                      "paddingAll": 'sm',
                      "spacing": 'md',
                      "position": 'relative'
                    }
                  ]
                }
              }
            }

            client.reply_message(event['replyToken'], message)
          end

        when Line::Bot::Event::Postback # お世話ボタンが押された時にdog_careに保存する
          user = Authentication.find_by(uid: event['source']['userId']).user
          dog = user.dog
          if event['postback']['data'].include?('care_type')
            care_type_id = event['postback']['data'].split(',')[1].to_i
            dog.dog_cares.create!(care_type_id: care_type_id)
            message = {
              type: 'text',
              text: 'お世話を登録しました！'
            }
            client.reply_message(event['replyToken'], message)
          end
        end
      end
    end
  end
end

require 'erb'
require './magic_ball'

class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }

    
    answer = MagicBall.answer

    
    template = %(
      <html>
        <head>
          <meta charset='utf-8'>
          <link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
          <title><%= name %></title>
        </head>
        <body>
          <h1>Messages for <%= name %></h1>
          <ul>
            <% messages.each do |message| %>
              <li><%= message %></li>
            <% end %>
          </ul>
        </body>
      </html>
    )

   
    name = "Magic Ball"
    messages = [
      "Ваш ответ: #{answer}",
      "Спросите опять, если хотите"
    ]

    
    html = ERB.new(template).result(binding)

  
    [200, headers, [html]]
  end
end

run App.new

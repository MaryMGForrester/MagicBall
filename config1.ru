require './magic_ball'

class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }

    answer = MagicBall.answer

    html =  <<~HTML
      <html>
        <head>
          <meta charset='utf-8' />
          <link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css" />
          <title>Magic Ball</title>
          <head>
        <body>
          <main><h1>#{answer}</h1></main>
        </body>
      </html>
    HTML

    response = [html]

    [200, headers, response]
  end
end

run App.new
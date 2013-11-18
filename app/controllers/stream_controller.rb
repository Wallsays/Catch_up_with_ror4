class StreamController < ApplicationController
  include ActionController::Live
 
  def index
    begin
      response.headers["Content-Type"] = "text/event-stream"
      # response.stream.write "hello world\n\n"
      # response.stream.close    
      10.times { |i|
        response.stream.write "data: #{i}\n\n"
        sleep 2
      }
    rescue IOError
      # ... 
    ensure
      response.stream.close
    end 
  end

end

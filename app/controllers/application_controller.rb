class ApplicationController < ActionController::Base

  # https://zenn.dev/sesere/articles/29b59a79ffdda8
  after_action :flash_turbo_frame
  def flash_turbo_frame
    return if response.redirect?
    message = {}
    if turbo_frame_request?
      message = flash.inject({}) do |hash, (type, _message)|
        # XSS対策&日本語のエスケープ
        hash[type] = CGI.escape("#{ERB::Util.html_escape(_message)}")
        hash
      end.to_json
      flash.discard
    end
    response.set_header(
      'X-Flash-Messages',
      message
    )
  end
end

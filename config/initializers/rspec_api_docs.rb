RspecApiDocumentation.configure do |config|

  config.docs_dir = Rails.root.join("doc", "api")
  config.format = [:json]
end

module RspecApiDocumentation
  class RackTestClient < ClientBase
    def response_body
      last_response.body.encode('utf-8')
    end
  end
end
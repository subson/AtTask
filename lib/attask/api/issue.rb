module Attask
  module API
    class Issue < Base

      api_model Attask::Issue

      include Attask::Behavior::Default

      def search(path,options)
        response = request(:get, credentials, api_model.api_path + path, options)
        json = response.parsed_response["data"]
        json
      end
    end
  end
end

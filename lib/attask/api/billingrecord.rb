module Attask
  module API
    class BillingRecord < Base

      api_model Attask::BillingRecord

      include Attask::Behavior::Default


      def add_hours(object,hours_collection)
        billing_record_id = object["ID"]
        hours_collection_string = CGI.escape(hours_collection.join(","))
        response = request(:post, credentials, "/billingrecords/hour/add", :query => {
                                    :objIDs => hours_collection_string, :billingRecordID => billing_record_id
                                })
        response
      end


    end
  end
end
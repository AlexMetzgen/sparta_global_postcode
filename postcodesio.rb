# require 'httparty'
# require 'json'
#
#
# class Postcode
#   include HTTParty
#   attr_accessor :single_postcode_results, :multi_postcode_results
#
#   base_uri 'https://api.postcodes.io'
#
#
#   def get_single_postcode(postcode)
#     @single_postcode_results=self.class.get("/postcodes/#{postcode}")
#   end
#
#   def get_multiply_postcodes(postcodesArray)
#     @multi_postcode_results=self.class.post("/postcodes/", body: {'postcodes': postcodesArray}).body
#      @multi_postcode_results = JSON.parse(@multi_postcode_results)
#   end
#
#
# end
# postcode=Postcode.new
# # postcodeget_single_postcode("da81by")
# postcode.get_multiply_postcodes(["da82by", "da81by"])
# # p postcode_single.single_postcode_results
# p postcode.multi_postcode_results

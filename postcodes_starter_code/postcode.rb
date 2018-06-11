require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)

    @singlePost= JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    @twoPost=JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_status
    @singlePost["status"]
  end

  def is_hash
    @singlePost
  end

  def postcode_length
    @singlePost["result"]["postcode"].length
  end

  def quality_key
    @singlePost["result"]["quality"]
  end

  def ordnace_survey
    @singlePost["result"]["eastings"]
  end

  def country
    @singlePost["result"]["country"]
  end

  def nhs_authority
    @singlePost["result"]["nhs_ha"]
  end

  def longitude
    @singlePost["result"]["longitude"]
  end

  def latitude
    @singlePost["result"]["latitude"]
  end

  def european_electoral_region
    @singlePost["result"]["european_electoral_region"]
  end

  def primary_care_trust
    @singlePost["result"]["primary_care_trust"]
  end

  def region
    @singlePost["result"]["region"]
  end

  def parish
    @singlePost["result"]["parish"]
  end

  def lsoa
    @singlePost["result"]["lsoa"]
  end

  def msoa
    @singlePost["result"]["msoa"]
  end

  def admin_disrict
    @singlePost["result"]["admin_district"]
  end

  def incode
    @singlePost["result"]["incode"].length
  end


  def twoPostStatus
    @twoPost["status"]
  end

  def firstSecondPostCode
    arr=[]
    arr<<@twoPost["result"][0]["postcode"]
  end

  def secondSecondPostCode
    arr=[]
    arr<<@twoPost["result"][1]["postcode"]
  end

  def twohash
    @twoPost
  end

  def twolength
    arr=[]
    @twoPost['result'].each do |postcode|
      arr<< postcode ['result']['postcode'].length
    end
    arr
  end

    def twoquality
      arr=[]
      @twoPost['result'].each do |quality|
        arr<< quality ['result']['quality']
      end
      arr
    end

    def twosurvey
      arr=[]
      @twoPost['result'].each do |survey|
        arr<< survey ['result']['quality']
      end
      arr
    end

    def twoNHS
      arr=[]
      @twoPost['result'].each do |nhs|
        arr<< nhs['result']['nhs_ha']
      end
      arr
    end

    def twolongitude
      arr=[]
      @twoPost['result'].each do |longitude|
        arr<< longitude ['result']['longitude']
      end
      arr
    end

    def twolatitude
      arr=[]
      @twoPost['result'].each do |latitude|
        arr<< latitude ['result']['latitude']
      end
      arr
    end

    def two_parliamentary
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['parliamentary_constituency']
      end
      arr
    end

    def two_european_electoral
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['european_electoral_region']
      end
      arr
    end

    def two_primary_care
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['primary_care_trust']
      end
      arr
    end

    def two_primary_care
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['primary_care_trust']
      end
      arr
    end

    def two_region_string
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['region']
      end
      arr
    end

    def two_parish
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['parish']
      end
      arr
    end

    def two_lsoa
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['lsoa']
      end
      arr
    end

    def two_msoa
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['msoa']
      end
      arr
    end

    def two_admin_district
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['admin_district']
      end
      arr
    end

    def two_incode
      arr=[]
      @twoPost['result'].each do |k|
        arr<< k ['result']['incode'].length
      end
      arr
    end
end
show = Postcodesio.new





p show.get_multiple_postcodes(["DA81BY","DA81BY"])
# p show.get_single_postcode("da81by")



 # p show.status

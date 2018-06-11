require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('DA81BY') #input a postcode
    end

    it "should respond with a status message of 200" do
         expect(@postcodesio.get_status).to eq 200
    end

    it "should have a results hash" do
       expect(@postcodesio.is_hash).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.postcode_length).to be_between(5, 7)

    end

    it "should return an quality key integer between 1-9" do
       expect(@postcodesio.quality_key).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.ordnace_survey).to be_kind_of(Integer)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.ordnace_survey).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.country).to eq "England"
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.nhs_authority).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.longitude).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.latitude).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.latitude).to be_kind_of(Float)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.european_electoral_region).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.primary_care_trust).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.region).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.parish).to be_kind_of(String)
    end

    it "should return a lsoa string" do
        expect(@postcodesio.lsoa).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.msoa).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.admin_disrict).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.incode).to be <=3
    end


    it "should return a msoa string" do
      expect(@postcodesio.msoa).to be_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
        expect(@postcodesio.incode).to be_between(3,4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(["DA81BY","DA81BY"]) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      # expect(@postcodesio.get_single_postcode).to eq 200
          expect(@postcodesio.twoPostStatus).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.firstSecondPostCode).to be == @postcodesio.firstSecondPostCode
    end

    it "should return the second query as the first postcode in the response" do
        expect(@postcodesio.secondSecondPostCode).to be == @postcodesio.secondSecondPostCode
    end

    it "should have a results hash" do
       expect(@postcodesio.twohash).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do

      expect(@postcodesio.twolength).to all(be_between(5,7))
    end

    it "should return an quality key integer between 1-9" do
        expect(@postcodesio.twoquality).to all(be_between(1,9))
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.twosurvey).to all(be_kind_of(Integer))
    end

    it "should return a country which is one of the four constituent countries of the UK" do
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.twoNHS).to all(be_kind_of(String))
    end

    it "should return a longitude float value" do
        expect(@postcodesio.twolongitude).to all(be_kind_of(Float))
    end

    it "should return a latitude float value" do
      expect(@postcodesio.twolongitude).to all(be_kind_of(Float))
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.two_parliamentary).to all(be_kind_of(String))
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.two_european_electoral).to all(be_kind_of(String))
    end

    it "should return a primary_care_trust string" do
          expect(@postcodesio.two_primary_care).to all(be_kind_of(String))
    end

    it "should return a region string" do
      expect(@postcodesio.two_region_string).to all(be_kind_of(String))
    end

    it "should return a parish string" do
      expect(@postcodesio.two_parish).to all(be_kind_of(String))
    end

    it "should return a lsoa string" do
      expect(@postcodesio.two_lsoa).to all(be_kind_of(String))
    end

    it "should return a msoa string" do
  expect(@postcodesio.two_msoa).to all(be_kind_of(String))
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        expect(@postcodesio.two_admin_district).to all(be_kind_of(String))
    end

    it "should return a incode string of three characters" do
        expect(@postcodesio.two_incode).to be <=3
    end


    it "should return a incode string of 3-4 characters" do
        expect(@postcodesio.two_incode).to be_between(3, 4)
    end
  end
end

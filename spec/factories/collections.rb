
# Dummy up an Collection record for Fedora ingestion
# Note that every test that uses this factory will have to be wrapped
# in a VCR cassette since saving Fedora records in Hydra requires an http call
FactoryGirl.define do

  factory :collection do
    identifier "test_collection1"
    title  "Collection of records"
    creator ["Special Collections"]
    publisher ["Special Collections","DLTS"]
    description "We need to test how collection works"
    rights "rights1"
    discoverable 'Y'
    after(:build) { |record| record.set_edit_groups(['admin_group'],[]) }


    factory :collection_with_nyucores do
     after(:create) { |record| record.nyucores<<build(:nyucore) }
    end

    factory :collection_for_gis_cataloger do
      after(:build) { |record| record.set_edit_groups(['gis_cataloger'],[]) }
    end
  end
end

# Dummy up an NYUcore record for Fedora ingestion
# Note that every test that uses this factory will have to be wrapped
# in a VCR cassette since saving Fedora records in Hydra requires an http call
FactoryGirl.define do
  factory :nyucore do
    title ["LION"]
    creator ["Hugh Plisher"]
    available ["http://library.nyu.edu"]
    description ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non posuere lectus. In facilisis, arcu nec tempor vulputate, justo elit aliquet sapien, in tincidunt lorem purus eu nulla."]
    edition ["10C"]
    series ["NYCDCP_DCPLION_10CAV"]
    version ["DSS.NYCDCP_DCPLION_10cav\DSS.BOLIVAR"]
    date ["12/05/2014","04/01/1666"]
    type ["Rosie Stuff"]
    language ["English"]
    relation ["relation1"]
    rights ["rights1"]
    subject ["vexillology"]
    publisher ["Rosie"]
    format ["ZIP"]
    citation ["Cite", "Me"]
    sequence(:identifier) { |n| "#{series.first}_#{n}" }
  end
end

require 'spec_helper'
describe LibGuides do
  let(:prefix) { 'libguides' }
  let(:collection) { "Research Guides" }
  let(:filename) { './spec/fixtures/sample_libguides.xml' }
  let(:collection_code) { 'libguides' }
  subject { LibGuides.new(filename) }
  it { should be_a LibGuides }
  it { should be_a Ichabod::ResourceSet::Base }
  its(:prefix) { should eq prefix }
  its(:collection) { should eq collection }
  its(:filename) { should eq filename }
  its(:collection_code) { should eq collection_code }
  its(:editors) { should eq ['admin_group', 'libguides_cataloger'] }
  its(:before_loads) { should eq [:add_edit_groups, :add_resource_set] }
  describe '.prefix' do
    subject { LibGuides.prefix }
    it { should eq prefix }
  end
  describe '.collection' do
    subject { LibGuides.collection }
    it { should eq collection }
  end
  describe '.source_reader' do
    subject { LibGuides.source_reader }
    it { should eq Ichabod::ResourceSet::SourceReaders::LibGuidesXmlFileReader }
  end
  describe '.editors' do
    subject { LibGuides.editors }
    it { should eq [:admin_group, :libguides_cataloger] }
  end
  describe '.before_loads' do
    subject { LibGuides.before_loads }
    it { should eq [:add_edit_groups, :add_resource_set] }
  end
end

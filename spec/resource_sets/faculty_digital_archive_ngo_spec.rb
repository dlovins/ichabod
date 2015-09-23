require 'spec_helper'
describe FacultyDigitalArchiveNgo do
  let(:prefix) { 'fda' }
  let(:collection) { "Asian NGOs Reports" }
  let(:endpoint_url) { 'http://archive.nyu.edu/request' }
  let(:set_handle) { 'hdl_2451_33605' }
  let(:load_number_of_records) { 5 }
  let(:args) { [endpoint_url, set_handle, load_number_of_records].compact }
  subject(:faculty_digital_archive_ngo) { FacultyDigitalArchiveNgo.new(*args) }
  it { should be_a FacultyDigitalArchiveNgo }
  it { should be_a Ichabod::ResourceSet::Base }
  its(:collection) { should eq collection }
  its(:endpoint_url) { should eq endpoint_url }
  its(:set_handle) { should eq set_handle }
  its(:editors) { should eq ['admin_group', 'fda_cataloger'] }
  its(:before_loads) { should eq [:add_edit_groups, :add_resource_set, :set_available_or_citation, :set_type] }
  describe '.prefix' do
    subject { FacultyDigitalArchiveNgo.prefix }
    it { should eq prefix }
  end
  describe '.collection' do
    subject { FacultyDigitalArchiveNgo.collection }
    it { should eq collection }
  end
  describe '.source_reader' do
    subject { FacultyDigitalArchiveNgo.source_reader }
    it { should eq Ichabod::ResourceSet::SourceReaders::OaiDcHttpReader }
  end
  describe '.editors' do
    subject { FacultyDigitalArchiveNgo.editors }
    it { should eq [:admin_group, :fda_cataloger] }
  end
  describe '.before_loads' do
    subject { FacultyDigitalArchiveNgo.before_loads }
    it { should eq [:add_edit_groups, :add_resource_set, :set_available_or_citation, :set_type] }
  end
end

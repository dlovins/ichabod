require 'spec_helper'
module Ichabod
  module ResourceSet
    module SourceReaders
      describe RosieTheRiveterReader do
        let(:user) { ENV['ICHABOD_ROSIE_USER'] || 'user' }
        let(:password) { ENV['ICHABOD_ROSIE_PASSWORD'] || 'password' }
        let(:endpoint_url) { 'http://dev-dl-pa.home.nyu.edu' }
        let(:collection_code) { 'rosie' }
        let(:resource_set) { mock_resource_set }
        before do
          allow(resource_set).to receive(:endpoint_url) { endpoint_url }
          allow(resource_set).to receive(:collection_code) { collection_code }
          allow(resource_set).to receive(:user) { user }
          allow(resource_set).to receive(:password) { password }
        end
        subject(:reader) { RosieTheRiveterReader.new(resource_set) }
        describe '#resource_set' do
          subject { reader.resource_set }
          it { should eq resource_set }
        end
        describe '#read', vcr: {cassette_name: 'resource sets/rosie the riveter'} do
          subject(:read) { reader.read }
          it { should be_an Array }
          it { should_not be_empty }
          its(:size) { should eq 33 }
          it 'should include only ResourceSet::Resources' do
            subject.each do |resource|
              expect(resource).to be_a ResourceSet::Resource
            end
          end
          describe 'the first record' do
            subject { read.first }
            its(:prefix) { should eq resource_set.prefix }
            its(:identifier) { should include '4jeads/node/827' }
            its(:title) { should include 'Jerre Kalbas' }
            its(:available) { should include 'http://hdl.handle.net/2333.1/6djh9wm1' }
            its(:type) { should include 'Video' }
            its(:series) { should include 'The Real Rosie the Riveter' }
          end
        end
      end
    end
  end
end
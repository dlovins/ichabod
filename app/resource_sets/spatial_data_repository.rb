class SpatialDataRepository < Ichabod::ResourceSet::Base
  self.prefix = 'sdr'
  self.collection = "Spatial Data Repository"
  self.source_reader = :oai_dc_file_reader
  editor :gis_cataloger
  set_restriction :nyu_only
  before_load :add_additional_info_link

  attr_reader :filename

  def initialize(*args)
    @filename = args.shift
    super
  end

  private
  def add_additional_info_link(*args)
    nyucore = args.last
    nyucore.source_metadata.addinfolink = 'http://nyu.libguides.com/content.php?pid=169769&sid=1489817'
    nyucore.source_metadata.addinfotext = 'GIS Dataset Instructions'
  end
end

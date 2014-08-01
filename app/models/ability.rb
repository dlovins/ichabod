class Ability
  include Hydra::Ability

  # Define any customized permissions here.
  def custom_permissions
    # Aliasing create/read/update/delete actions
    alias_action :create, :read, :update, :destroy, :to => :crud
    # Limits creating new objects to a specific group
    if user_groups.include? 'gis_cataloger'
      can [:crud], Nyucore do |nyucore|
        nyucore.type.include? "Geospatial Data"
      end
    end
  end
end

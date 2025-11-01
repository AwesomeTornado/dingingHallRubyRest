class Api::LocationsController < ApiController
  include RESTFramework::ModelControllerMixin

  self.fields = [:id, :name, :open, :close]

  #self. = [:new, :create, :index, :destroy]

  def new
    puts "I'm a real function now!"
    @location = Location.new
  end

  def create
    location_params = params[:location]
    new_location = Location.new(name: location_params[:name],
                                open: location_params[:open],
                                close: location_params[:close])
    new_location.save
    render(api: Location.find_by_name(new_location.name))
  end

  def destroy
    unless (selected = Location.where(id: params[:id])).nil?
      selected.delete_all
    end
    render(api: get_recordset)
  end

  def first
    # Always use the bang method, since the framework will rescue `RecordNotFound` and return a
    # sensible error response.
    render(api: self.get_recordset.first!)
  end

  def get_recordset
    Location.all
  end
end

class Api::LocationController < ApiController
  include RESTFramework::ModelControllerMixin

  self.fields = [:id, :name, :open, :close]

  def new
    puts "I'm a real function now!"
    @location = Location.new
  end

  def create
    location_params = params[:location]
    new_location = Location.new(:name => location_params[:name],
                                :open => location_params[:open],
                                :close => location_params[:close])
    new_location.save
    render(api: Location.find_by_name(new_location.name))
  end

  def destroy
    Location.find(params[:id]).destroy
    render(api: get_recordset)
  end

  def first
    # Always use the bang method, since the framework will rescue `RecordNotFound` and return a
    # sensible error response.
    render(api: self.get_recordset.first!)
  end

  def get_recordset
    return Location.all
  end
end

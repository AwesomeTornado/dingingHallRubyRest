class Api::LocationController < ApiController
  include RESTFramework::ModelControllerMixin

  self.fields = [:id, :name, :open, :close]
  #self.extra_member_actions = {first: :get}
  self.extra_actions = {first: :get}

  def first
    # Always use the bang method, since the framework will rescue `RecordNotFound` and return a
    # sensible error response.
    render(api: self.get_recordset.first!)
  end

  def get_recordset
    return Location.all
  end
end

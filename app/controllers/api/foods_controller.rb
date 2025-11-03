class Api::FoodsController < ApiController
  include RESTFramework::ModelControllerMixin

  def new
    @food = Food.new
  end

  def create
    params.permit!
    new_food = Food.new(params[:food])
    new_food.save!
    render(api: Food.find_by_name!(new_food.name))
  end

  def destroy
    unless (selected = Food.where(id: params[:id])).nil?
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
    Food.all
  end

  def update
    super
  end
end

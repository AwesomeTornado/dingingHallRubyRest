class Api::MenusController < ApiController
  include RESTFramework::ModelControllerMixin

  self.extra_member_actions = {add_foods: :patch, remove_foods: :patch}

  def new
    @menu = Menu.new
  end

  def create
    new_menu = Menu.new(menu_params)
    new_menu.save!
    render(api: Menu.find_by_name!(new_menu.name))
  end

  def destroy
    unless (selected = Menu.where(id: params[:id])).nil?
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
    Menu.all
  end

  def menu_params
    params.require(:menu).permit :name
  end

  def update
    super
  end

  def add_foods
    foods = params[:foods]
    menu = Menu.find params[:id]
    foods.each do |food_index|
      food = Food.find(food_index)
      unless menu.foods.include? food
        menu.foods << food
      end
    end
    menu.save!
    render api: menu
  end

  def remove_foods
    foods = params[:foods]
    menu = Menu.find params[:id]
    foods.each do |food|
      menu.foods.delete food
    end
    menu.save!
    render api: menu
  end
end
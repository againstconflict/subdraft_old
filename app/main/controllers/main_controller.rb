# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController
  model :store
  
  def index
    # Add code for when the index view is loaded
  end

  def about
    # Add code for when the about view is loaded
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
  
  def add_subdraft
    _subdrafts << { name: _new_subdraft }
    _new_subdraft = ''
  end
  
  def remove_subdraft(subdraft)
    _subdrafts.delete(subdraft)
  end
  
  def current_subdraft
    _subdrafts[params._index.or(0).to_i]
  end
  
  def check_all
    _subdrafts.each { |subdraft| subdraft._completed = true }
  end
  
  def completed
    _subdrafts.count { |s| s._completed }
  end

  def incomplete
    _subdrafts.size - completed
  end
  
  def percent_complete
    (completed / _subdrafts.size.to_f * 100).round
  end
  
end

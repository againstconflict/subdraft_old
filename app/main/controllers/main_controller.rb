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
    _subdrafts[params._subdraft_index.or(0).to_i]
  end
  
  def add_tag(subdraft)
    subdraft._tags << { name: _new_subdraft_tag }
    _new_subdraft_tag = ''
  end
  
  def remove_tag(tag)
    _tags.delete(tag)
  end
  
  def current_tag
    _tags[params._tag_index.or(0).to_i]
  end
  
  def add_trait(tag)
    tag._traits << { name: _new_trait }
    _new_trait = ''
  end
  
  def remove_trait(trait)
    _traits.delete(trait)
  end
  
  def current_trait
    _traits[params._trait_index.or(0).to_i]
  end
  
end

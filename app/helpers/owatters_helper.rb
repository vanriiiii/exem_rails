module OwattersHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_owatters_path
    elsif action_name == 'edit'
      owatter_path
    end
  end
end

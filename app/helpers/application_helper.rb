module ApplicationHelper
  def choose_new_or_edit(model)
    if action_name == 'new' || action_name == 'confirm'
      send("confirm_#{model.pluralize}_path")
    elsif action_name == 'edit'
      send("#{model}_path")
    end
  end
end

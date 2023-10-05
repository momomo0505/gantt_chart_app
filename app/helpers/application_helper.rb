module ApplicationHelper
  def truncate_name(name)
    if name.length > 8
      name[0..7] + "\n" + name[8..-1]
    else
      name
    end
  end
end
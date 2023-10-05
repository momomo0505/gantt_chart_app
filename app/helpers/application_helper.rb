module ApplicationHelper
  def truncate_name(name)
    if name.length > 7
      name[0..6] + "\n" + name[7..-1]
    else
      name
    end
  end
end
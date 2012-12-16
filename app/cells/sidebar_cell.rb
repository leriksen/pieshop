class SidebarCell < Cell::Rails

  def show(args)
    @role_items = []
    build_nav_from_role @role_items, args[:user]
    render
  end

private
  def build_nav_from_role(collection, user)
    return unless user
    puts "user is #{user.inspect}"
    case user.role.role_name
    when "administrator"
      add_link collection, "Users",  users_path
    end
  end

  def add_link(collection, text,  path)
    collection << view_context.link_to(text, path)
  end
end

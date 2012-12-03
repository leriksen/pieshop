class SidebarCell < Cell::Rails

  def show(args)
    @role_items = []
    build_nav_from_role @role_items, args[:user]
    render
  end

private
  def build_nav_from_role(collection, role)
    return unless role
    case role.user_type.typename
    when "admin"
      add_link collection, "User Types",  user_types_path
      add_link collection, "Users",  users_path
      
    end
  end

  def add_link(collection, text,  path)
    collection << view_context.link_to(text, path)
  end
end

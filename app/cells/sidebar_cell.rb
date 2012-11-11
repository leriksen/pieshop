class SidebarCell < Cell::Rails

  def show
    @role_items = []
    (1..5).each do |n|
      @role_items << view_context.link_to( "role#{n}", user_types_path)
    end
    render
  end

end

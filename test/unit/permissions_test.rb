require 'permissions'
require 'test/unit'

class TestPermissions < Test::Unit::TestCase
  def setup
    @p = Permissions.new
  end

  def test_is_administrator
    @p.set_as_administrator
    
    assert(@p.is_administrator?, "is a administrator")
  end

  def test_is_maintainer
    @p.set_as_maintainer
    
    assert(@p.is_maintainer?, "is a maintainer")
  end
  
  def test_is_deployer
    @p.set_as_deployer
    assert(@p.is_deployer?, "is a deployer")
  end
  
  def test_is_creator
    @p.set_as_creator
    assert(@p.is_creator?, "is a creator")
  end
  
  def test_is_viewer
    @p.set_as_viewer
    assert(@p.is_viewer?, "is a viewer")
  end

  def test_unset_administrator
    @p.set_as_administrator
    @p.unset_as_administrator
    
    assert(!@p.is_administrator?, "is not a administrator")
  end

  def test_unset_maintainer
    @p.set_as_maintainer
    @p.unset_as_maintainer
    
    assert(!@p.is_maintainer?, "is not a maintainer")
  end
  
  def test_unset_deployer
    @p.set_as_deployer
    @p.unset_as_deployer
    assert(!@p.is_deployer?, "is not a deployer")
  end
  
  def test_unset_creator
    @p.set_as_creator
    @p.unset_as_creator
    assert(!@p.is_creator?, "is not a creator")
  end
  
  def test_unset_viewer
    @p.set_as_viewer
    @p.unset_as_viewer
    assert(!@p.is_viewer?, "is not a viewer")
  end

  def test_administrator_can_do_viewer
    @p.set_as_administrator
    assert(@p.can_do_viewer?, "can do viewer role")
  end

  def test_administrator_can_do_administrator
    @p.set_as_administrator
    assert(@p.can_do_administrator?, "can do administrator role")
  end

  def test_viewer_cant_do_administrator
    @p.set_as_viewer
    assert(!@p.can_do_administrator?, "cant do administrator role")
  end

  def test_deny_all_access
    @p.deny_all_access

    assert(!@p.can_do_administrator?, "cant do administrator role")
    assert(!@p.can_do_viewer?, "cant do viewer role")
  end

  def test_default_initializer    
    @p = Permissions.new
    assert(@p.can_do_viewer?, "can initialize as viewer role")
  end

  def test_initializer    
    @p = Permissions.new(:maintainer)
    assert(@p.can_do_maintainer?, "can initialize as maintainer role")
  end

  def test_to_i
    @p = Permissions.new(:maintainer)
    assert(@p.to_i == 2**Permissions.get_role(:maintainer), "can convert permission to an integer for storage")
  end

  # test self<<get_role
  def test_get_role
    assert(Permissions.get_role(:maintainer) == Permissions::ROLEMAP[:maintainer])
  end

  # test #get_role
  def test_get_role
    @p.set_as_maintainer
    assert(@p.get_role(:viewer) == Permissions::ROLEMAP[:viewer])
  end

  # test #role_names
  def test_roles
    assert(Permissions.role_names == Permissions::ROLEMAP.keys, "can return a list of role names")
  end

  def test_role_name
    assert(Permissions.role_name(:maintainer) == 'Maintainer'  , "can return a display name for a known role"  )
    assert(Permissions.role_name(:destroyer ) == 'unknown role', "can return a display name for a unknown role")
  end

  def test_multiple_roles
    @p.set_as_deployer
    assert(@p.can_do_viewer?, "can initialize as viewer role")
    assert(@p.can_do_maintainer?, "can initialize as maintainer role")
  end
end

class Permissions

  # map of role names to bit positions
  # the higher the bit position the more
  # importrant the role
  ROLEMAP = {
        administrator: 31,
        maintainer: 23,
        deployer: 15,
        creator: 7,
        viewer: 0
      }

  attr_accessor :permissions

  # by default, set viewer access
  # role_mask is thebit position to set
  def initialize(role = :viewer)
    @permissions = 0
    case role
    when Fixnum
      @permissions = role
    else
      # Fixnum has [], but not []=
      @permissions |= 2 ** ROLEMAP[role]
    end
  end

  # given a role_name, return the
  # corresponding bit position
  def get_role(role_name)
    self.class.get_role(role_name)
  end

  def self.get_role(role_name)
    ROLEMAP[role_name]
  end

  # get the keys (role_names) from the role map
  def self.role_names
    ROLEMAP.keys
  end

  # given a  role_name, create a displayable version, or a default unknown
  def self.role_name(role_name)
    ROLEMAP[role_name] ? role_name.to_s.capitalize : "unknown role"
  end

  # this method doesnt disable a login, but, in conjunction with CanCan,
  # doesn't allow access, even view access, to any CanCan-mediated
  # controllers
  def deny_all_access
    @permissions = 0
  end

  # return the permissions attribute as a simple integer, usually for comparision
  # or serialization purposes
  def to_i
    @permissions
  end

  # for each role found bitmmaped into role_num, add to the list of roles
  # this role_num represents
  def self.roles(role_num)
    roles = []
    ROLEMAP.each_key do |role_name|
      if (role_num[get_role(role_name)]) != 0
        roles << role_name
      end
    end
    return roles
  end

  def roles
    roles = []
    ROLEMAP.each_key do |role_name|
      if (@permissions[get_role(role_name)]) != 0
        roles << role_name
      end
    end
    return roles
  end

  # create instance methods for each role, as convenience methods
  ROLEMAP.each_key do |role|

    # cache bit position
    role_mask = get_role(role)

    # make the specified role active
    define_method "set_as_#{role.to_s}" do
      @permissions = @permissions | 2 ** role_mask
    end

    #clears the specified role
    define_method "unset_as_#{role.to_s}" do
      @permissions = @permissions ^ 2 ** role_mask
    end

    # is specified role active ?
    define_method "is_#{role.to_s}?" do
      (@permissions & 2 ** role_mask) != 0
    end

    # returns the bit position a particular role sits at
    define_singleton_method "#{role}" do
      role_mask
    end
  end
end
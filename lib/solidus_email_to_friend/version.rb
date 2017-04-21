module SolidusEmailToFriend
  # Returns the version of the currently loaded SpreeEmailToFriend as a
  # <tt>Gem::Version</tt>.
  def self.version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 1
    MINOR = 3
    TINY  = 0
    PRE   = nil

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end

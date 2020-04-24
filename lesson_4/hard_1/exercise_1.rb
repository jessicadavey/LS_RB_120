class SecretFile

  def initialize(data, security_log)
    @data = data
    @security_log = security_log
  end
  
  def data
    @security_log.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    puts "log entry generated"
    # ... implementation omitted ...
  end
end

my_file = SecretFile.new("this is a secret", SecurityLogger.new)

puts my_file.data
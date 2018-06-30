module JSend

  class HashUtils
    def self.remove_fields(hash, fields)
      hash.keep_if { |x| !fields.include? x }
    end

    def self.has_fields_different_from(hash, fields)
      not remove_fields(hash.clone, fields).empty?
    end
  end

  private_constant :HashUtils

end
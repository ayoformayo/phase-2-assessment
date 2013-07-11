class EmailValidator < ActiveModel::Validator
  # Remember to create a migration!
def validate_each(record, attribute, value)
    unless value =~ /(.+@.+(com|net|edu))/
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

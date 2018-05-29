class PhoneNumber
  INVALID_NUMBER = '0000000000'.freeze

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    phone_num = only_numbers || INVALID_NUMBER
    phone_num = phone_num[1..-1] if phone_num.size == 11 && phone_num[0] == '1'
    phone_num.size == 10 ? phone_num : INVALID_NUMBER
  end

  def area_code
    number[0, 3]
  end

  def to_s
    phone_split = number.scan(/.{1,3}/)
    "(#{phone_split.shift}) #{phone_split.shift}-#{phone_split.join}"
  end

  private

  def only_numbers
    @phone_number.gsub(/\D/, '') if @phone_number.count('a-zA-z').zero?
  end
end

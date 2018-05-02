class SecretHandshake
  def initialize(decimal)
    @binary = convert_to_binary(decimal).to_i.digits
  end

  def commands
    @binary.each_with_object([]).with_index do |(number, actions), idx|
      take_action[idx].call(actions) if number == 1
    end
  end

  private

  def convert_to_binary(decimal)
    decimal = decimal.instance_of?(String) ? decimal.to_i(2) : decimal
    decimal.to_s(2)
  end

  def take_action
    [proc { |actions| actions << 'wink' },
     proc { |actions| actions << 'double blink' },
     proc { |actions| actions << 'close your eyes' },
     proc { |actions| actions << 'jump' },
     proc { |actions| actions.reverse! }]
  end
end

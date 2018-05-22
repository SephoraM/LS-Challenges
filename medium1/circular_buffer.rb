module BufferExceptions
  class BufferFullException < StandardError; end

  class BufferEmptyException < StandardError; end
end

class CircularBuffer
  include BufferExceptions

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = []
  end

  def read
    @buffer.empty? ? raise(BufferEmptyException) : @buffer.shift
  end

  def write(element)
    return if element.nil?
    buffer_full? ? raise(BufferFullException) : @buffer.push(element)
  end

  def write!(element)
    return if element.nil?
    buffer_full? ? @buffer.push(element).shift : write(element)
  end

  def clear
    @buffer = []
  end

  private

  def buffer_full?
    @buffer.size == @buffer_size
  end
end

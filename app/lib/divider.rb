class Divider
  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
  end

  def divide
    if @num2 == 0
      raise ZeroDivisionError, "Division by zero is not allowed."
    else
      @num1 / @num2.to_f
    end
  end
end



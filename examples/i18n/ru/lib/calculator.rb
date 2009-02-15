class Calculator
  def push(n)
    @args ||= []
    @args << n
  end
  
  def +
    @args.inject(0){|n,sum| sum+=n}
  end  
end
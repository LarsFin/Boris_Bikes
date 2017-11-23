class Van
  attr_reader :cargo

  def cargo= cargo
    @cargo = cargo
    cargo = []
  end

end

class Role::Reader < Role

  def name_as_string
    "Reader"
  end

  def reader?
    true
  end
end

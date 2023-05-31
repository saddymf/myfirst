module ListsHelper
  def list_count(list)
    list.count
  end

  def load_number_lowest(list)
         List.minimum(:number)
  end

  def load_number_max(list)
     List.maximum(:number)
  end
end

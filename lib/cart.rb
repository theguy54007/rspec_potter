class Cart

  PRICE = 100 #每本書的單價100元

  def add(items)
    @ordered_items = items.map{ |key, value| value } .delete_if{|i| i == 0} # 把資料由Hash轉成陣列,刪除客戶沒買的集數
  end

  def calculate #計算客戶所買的書本總價
    total = 0
    while @ordered_items.size > 0
      if @ordered_items.size == 3
        total = total + 3 * PRICE * 0.9
      elsif @ordered_items.size == 2 #  如果買了一組，要依原價打5%
        total = total + 2 * PRICE * 0.95
      else
        total = total + PRICE
      end
        @ordered_items = @ordered_items.map { |i| i -= 1  }
        @ordered_items = @ordered_items.delete_if{|i| i == 0}
    end
    
    return total
  end


end
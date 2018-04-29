class Cart

  PRICE = 100 #每本書的單價100元

  def add(items)
    @ordered_items = items.map{ |key, value| value } .delete_if{|i| i == 0} # 把資料由Hash轉成陣列,刪除客戶沒買的集數
  end

  def calculate #計算客戶所買的書本總價
    total = 0
    while @ordered_items.size > 0 #結帳前計算金額
      if @ordered_items.size == 5 #有5集不同書，打80折
        total = total + 5 * PRICE * 0.8
      elsif @ordered_items.size == 4 #有4集不同書，打85折
        total = total + 4 * PRICE * 0.85
      elsif @ordered_items.size == 3 #有3集不同書，打90折
        total = total + 3 * PRICE * 0.9
      elsif @ordered_items.size == 2 #  如果買了一組，要依原價打5%
        total = total + 2 * PRICE * 0.95
      else
        total = total + PRICE #只有單本就原價即可
      end
        @ordered_items = @ordered_items.map { |i| i -= 1  } #上面每計算一次，每本都減 1 ， 並把 0 集數刪除
        @ordered_items = @ordered_items.delete_if{|i| i == 0}
    end
    
    return total #回傳最後金額
  end


end
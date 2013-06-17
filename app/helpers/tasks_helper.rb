module TasksHelper
  def getFirstItem(items)

    @item = items.where('state_id = 1').first

    if @item.nil?
      ' '
    else
      if @item.user.nil?
        ' '
      else
        @item.user.name
      end
    end

  end
end

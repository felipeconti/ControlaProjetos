module CustomersHelper
  def getNameOrNick(name, nick)
    if nick.empty?
      return name
    else
      return nick
    end
  end
end

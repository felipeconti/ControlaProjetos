module ApplicationHelper

  def gravatar_tag(email, options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=#{options[:size]}", options
  end

  def cutString(toCut, number)
    if toCut.bytesize > number
      toCut = toCut[0..number] + "..."
    end
    return toCut
  end

  def get_where_with_state_and_priority(type)
      case type
        when 1
          "priority > 0 and state_id in (select id from states where UPPER(description) like 'PENDENTE' )"
        when 2
          "state_id = 2  OR state_id in (select id from states where UPPER(description) like 'CONCLU%DO' )"
        when 3
          "state_id = 3  OR state_id in (select id from states where UPPER(description) like 'CANCELADO' )"
        else
          "priority = 0 and state_id in (select id from states where UPPER(description) like 'PENDENTE' )"
        end
    end

  def get_where_with_state(type)
    case type
      when 2
        "state_id = 2  OR state_id in (select id from states where UPPER(description) like 'CONCLU%DO' )"
      when 3
        "state_id = 3  OR state_id in (select id from states where UPPER(description) like 'CANCELADO' )"
      else
        "state_id = 1  OR state_id in (select id from states where UPPER(description) like 'PENDENTE' )"
    end
  end

  def getDesc(desc)
    t('description') + ": "+ %Q{#{desc}} # Mesmo colocando %Q{} não esta identando!
  end
end

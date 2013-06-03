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

end

class ExpositorSearch < Searchlight::Search
  search_on Expositor.includes(:user)

  FIELDS = %w(
    company
    details
    name
    facebook
    twitter
    skype
    instagram
  )

  searches :q

  def search_q
    query_str = FIELDS.map do |field|
      "#{field} ILIKE :q"
    end.join(" OR ")
    search.where(query_str, q: "%#{q}%")
  end
end

module LocationsHelper

	def short location
    j = location.journal.to_s
    if @read_more == location.id
      read_less = link_to ' Read Less', locations_path(read_more: 0)
      j + read_less
    else
      read_more = link_to 'Read More', locations_path(read_more: location.id)
      t = truncate j, length: 20, omission: '... '
      t.gsub('... ', "... #{read_more}")
    end
  end

end

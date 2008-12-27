def link_to(label,url)
  %{<a href="#{url}">#{label}</a>}
end

def show_samples(synset)
  list = ''
  return list if synset.samples.nil?
  synset.samples.first.sample
end
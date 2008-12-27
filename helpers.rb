def link_to(label,url)
  %{<a href="#{url}">#{label}</a>}
end

def show_samples(synset)
  begin
    synset.samples.first.sample
  rescue
    ""
  end
end